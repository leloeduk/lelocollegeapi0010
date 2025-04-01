import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../../../models/chapitre_model.dart';

class ApiChapitreController extends GetxController {
  var isLoading = false.obs;
  var chapitres = <ChapitreModel>[].obs;
  late Box hiveBox;

  @override
  void onInit() {
    super.onInit();
    initHive();
  }

  void initHive() async {
    hiveBox = await Hive.openBox('chapitreBox');
    await loadCachedChapitres();
    await fetchChapitres();
  }

  Future<void> fetchChapitres() async {
    isLoading.value = true;
    try {
      // Remplacez l'URL par celle correspondant à votre API des chapitres.
      final response = await http.get(
        Uri.parse('https://lelocollegeapi.onrender.com/api/chapitres/'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<ChapitreModel> fetchedChapitres =
            jsonData.map((json) => ChapitreModel.fromJson(json)).toList();
        chapitres.assignAll(fetchedChapitres);
        // Sauvegarde des données en cache dans Hive
        await hiveBox.put('cachedChapitres', jsonData);
      } else {
        Get.snackbar('Erreur', 'La récupération des chapitres a échoué');
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadCachedChapitres() async {
    var cached = hiveBox.get('cachedChapitres', defaultValue: []);
    if (cached.isNotEmpty) {
      List<dynamic> cachedList = cached;
      List<ChapitreModel> cachedChapitres =
          cachedList.map((json) => ChapitreModel.fromJson(json)).toList();
      chapitres.assignAll(cachedChapitres);
    }
  }
}
