import 'package:get/get.dart';
import '../../../models/devoir_model.dart';
import '../../../services/api/data/data_repository.dart';

class HomeworkController extends GetxController {
  var selectedCategory = 'classe'.obs;
  var devoirs = <DevoirModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = RxnString();

  final DatasRepository repository = DatasRepository();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // Récupération des devoirs en ligne avec fallback offline
  Future<void> fetchData() async {
    try {
      final data = await repository.fetchAllDatas();
      devoirs.value = (data["devoirs"] as List).cast<DevoirModel>();
      isLoading.value = false;
    } catch (e) {
      try {
        final cachedData = await repository.loadData<DevoirModel>(
          'devoirs',
          (json) => DevoirModel.fromJson(json),
        );
        devoirs.value = cachedData;
        isLoading.value = false;
      } catch (cacheError) {
        isLoading.value = false;
        errorMessage.value =
            'Erreur lors du chargement des données. Veuillez réessayer.';
      }
    }
  }
}
