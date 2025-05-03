import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../services/api/data/api_service.dart';
import '../models/school_class_model.dart';

part 'class_event.dart';
part 'class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  final ApiService apiService;
  late Box<SchoolClassModel> _classesBox;

  ClassBloc({required this.apiService}) : super(ClassInitial()) {
    on<FetchClasses>(_onFetchClasses);
    _initHive();
  }

  Future<void> _initHive() async {
    _classesBox = await Hive.openBox<SchoolClassModel>('classesBox');
  }

  Future<void> _onFetchClasses(
    FetchClasses event,
    Emitter<ClassState> emit,
  ) async {
    emit(ClassLoading());

    try {
      // Vérification de la connectivité
      final connectivity = await Connectivity().checkConnectivity();

      if (connectivity == ConnectivityResult.none) {
        // Mode hors ligne - charger depuis Hive
        final cachedClasses = _classesBox.values.toList();
        if (cachedClasses.isEmpty) {
          emit(
            ClassError(error: "Aucune connexion et pas de données en cache."),
          );
        } else {
          emit(ClassLoaded(classes: cachedClasses));
        }
        return;
      }

      // Mode en ligne - charger depuis l'API
      final classes = await apiService.fetchClasses();

      // Mise à jour du cache Hive
      await _updateHiveCache(classes);

      emit(ClassLoaded(classes: classes));
    } catch (e) {
      // En cas d'erreur, essayer de charger les données en cache
      final cachedClasses = _classesBox.values.toList();
      if (cachedClasses.isNotEmpty) {
        emit(ClassLoaded(classes: cachedClasses));
      } else {
        emit(ClassError(error: "Erreur: ${e.toString()}"));
      }
    }
  }

  Future<void> _updateHiveCache(List<SchoolClassModel> classes) async {
    await _classesBox.clear();
    for (var schoolClass in classes) {
      await _classesBox.add(schoolClass);
    }
  }

  @override
  Future<void> close() {
    _classesBox.close();
    return super.close();
  }
}
