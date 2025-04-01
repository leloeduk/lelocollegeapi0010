import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ApiClassController extends GetxController {
  var isLoading = false.obs;
  var data = [].obs;
  late Box hiveBox;

  @override
  void onInit() {
    super.onInit();
    initHive();
  }

  Future<void> initHive() async {
    hiveBox = await Hive.openBox('myBox');
    // Charge le cache dès l'initialisation
    await loadCachedData();
    // Tente de récupérer les données depuis l'API (si la connexion est disponible)
    await fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('https://lelocollegeapi.onrender.com/api/api/matieres/'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        data.assignAll(jsonData);
        // Sauvegarde les données dans Hive
        await hiveBox.put('cachedData', jsonData);
      } else {
        Get.snackbar('Erreur', 'La récupération des données a échoué');
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
      // En cas d'erreur (par exemple hors connexion), on charge les données en cache
      await loadCachedData();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadCachedData() async {
    var cached = hiveBox.get('cachedData', defaultValue: []);
    data.assignAll(cached);
  }
}
