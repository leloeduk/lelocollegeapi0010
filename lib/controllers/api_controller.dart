import 'dart:async';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../services/api/data/data_repository.dart';
import '../../../models/classe_model.dart';
import '../../../models/matiere_model.dart';
import '../../../models/chapitre_model.dart';
import '../../../models/devoir_model.dart';

class DataController extends GetxController {
  final DatasRepository _datasRepository = DatasRepository();

  // Observables pour les données
  var classes = <ClasseModel>[].obs;
  var matieres = <MatiereModel>[].obs;
  var chapitres = <ChapitreModel>[].obs;
  var devoirs = <DevoirModel>[].obs;

  // Observable pour la connectivité
  var isConnected = false.obs;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    fetchAllData();
  }

  // Initialise la détection de la connectivité
  void _initConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectionStatus(connectivityResult as ConnectivityResult);

    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(
              _updateConnectionStatus
                  as void Function(List<ConnectivityResult> event)?,
            )
            as StreamSubscription<ConnectivityResult>;
  }

  // Met à jour le statut de connexion et déclenche la récupération des données en conséquence
  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
      // Pas de connexion, on charge les données locales
      fetchLocalData();
    } else {
      isConnected.value = true;
      // Connexion disponible, on récupère les données depuis l'API
      fetchAllData();
    }
  }

  // Récupère l'ensemble des données via le repository
  Future<void> fetchAllData() async {
    final allData = await _datasRepository.fetchAllDatas();
    classes.value = allData['classes'] as List<ClasseModel>;
    matieres.value = allData['matieres'] as List<MatiereModel>;
    chapitres.value = allData['chapitres'] as List<ChapitreModel>;
    devoirs.value = allData['devoirs'] as List<DevoirModel>;
  }

  // Charge les données locales en cas d'absence de connexion
  Future<void> fetchLocalData() async {
    final allData = await _datasRepository.fetchAllDatas();
    classes.value = allData['classes'] as List<ClasseModel>;
    matieres.value = allData['matieres'] as List<MatiereModel>;
    chapitres.value = allData['chapitres'] as List<ChapitreModel>;
    devoirs.value = allData['devoirs'] as List<DevoirModel>;
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
