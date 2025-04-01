import 'package:get/get.dart';
import 'package:lelocollege/models/chapitre_model.dart';
import 'package:lelocollege/models/matiere_model.dart';
import '../../../models/classe_model.dart';
import '../../../services/api/data/data_repository.dart';

class ClassesController extends GetxController {
  var classes = <ClasseModel>[].obs;
  var matieres = <MatiereModel>[].obs;
  var chapitres = <ChapitreModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadClasses();
  }

  Future<void> loadClasses() async {
    try {
      // Appel au repository pour charger les données depuis Hive
      final loadedClasses = await DatasRepository().loadData<ClasseModel>(
        'classes',
        (json) => ClasseModel.fromJson(json),
      );
      classes.assignAll(loadedClasses);
      print("Classes chargées depuis Hive : ${loadedClasses.length}");
    } catch (e) {
      print('Erreur lors du chargement des données depuis Hive : $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMatieres() async {
    try {
      // Appel au repository pour charger les données depuis Hive
      final loadedMatieres = await DatasRepository().loadData<MatiereModel>(
        'classes',
        (json) => MatiereModel.fromJson(json),
      );
      matieres.assignAll(loadedMatieres);
      print("Classes chargées depuis Hive : ${loadedMatieres.length}");
    } catch (e) {
      print('Erreur lors du chargement des données depuis Hive : $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadChapitres() async {
    try {
      // Appel au repository pour charger les données depuis Hive
      final loadedChapitres = await DatasRepository().loadData<ChapitreModel>(
        'classes',
        (json) => ChapitreModel.fromJson(json),
      );
      chapitres.assignAll(loadedChapitres);
      print("Classes chargées depuis Hive : ${loadedChapitres.length}");
    } catch (e) {
      print('Erreur lors du chargement des données depuis Hive : $e');
    } finally {
      isLoading.value = false;
    }
  }
}
