import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../core/utils/app_colors.dart';
import '../controllers/homework_controller.dart';

class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Injection du contrôleur avec GetX
    final HomeworkController controller = Get.put(HomeworkController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Devoirs et Examens',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryGreen,
      ),
      body: Row(
        children: [
          // Côté gauche : Liste des catégories
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                _buildCategoryButton('Classe', 'classe', controller),
                _buildCategoryButton(
                  'Départemental',
                  'departemental',
                  controller,
                ),
                _buildCategoryButton('Composition', 'composition', controller),
              ],
            ),
          ),
          // Côté droit : Grille des devoirs
          Expanded(
            flex: 3,
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.green.shade800,
                  ),
                );
              }
              if (controller.errorMessage.value != null) {
                return Center(child: Text(controller.errorMessage.value!));
              }
              final filteredDevoirs =
                  controller.devoirs
                      .where(
                        (devoir) =>
                            devoir.categorie.toLowerCase() ==
                            controller.selectedCategory.value.toLowerCase(),
                      )
                      .toList();

              if (filteredDevoirs.isEmpty) {
                return const Center(
                  child: Text("Aucun devoir pour cette catégorie."),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: filteredDevoirs.length,
                itemBuilder: (context, index) {
                  final devoir = filteredDevoirs[index];
                  return Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        _openPdf(context, devoir.fichierPdf);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.assignment,
                              color: AppColors.secondaryGreen,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              devoir.titre,
                              style: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Matière: ${devoir.matiere.nom}',
                              style: const TextStyle(color: AppColors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  // Bouton de sélection de catégorie avec mise à jour réactive
  Widget _buildCategoryButton(
    String label,
    String category,
    HomeworkController controller,
  ) {
    return Obx(
      () => ListTile(
        title: Text(label),
        tileColor:
            controller.selectedCategory.value == category
                ? AppColors.primaryGreen
                : Colors.grey,
        onTap: () {
          controller.selectedCategory.value = category;
        },
      ),
    );
  }

  // Ouvrir un PDF dans un nouvel écran
  void _openPdf(BuildContext context, String pdfUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(
                title: const Text('PDF Viewer'),
                backgroundColor: AppColors.primaryGreen,
              ),
              body: SfPdfViewer.network(pdfUrl),
            ),
      ),
    );
  }
}
