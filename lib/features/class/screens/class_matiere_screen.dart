import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/api_class_controller.dart';
import '../widgets/classe_card.dart';

class ClassesMatieresChapitresPage extends StatelessWidget {
  final String className;
  final Color currentColor;

  const ClassesMatieresChapitresPage({
    super.key,
    required this.className,
    required this.currentColor,
  });

  @override
  Widget build(BuildContext context) {
    // Utilisation de ApiClassController à la place de ClassesController
    final ApiClassController controller = Get.put(ApiClassController());

    // Vous pouvez choisir d'appeler fetchData ici ou dans une action sur un bouton.
    // Par exemple, ici nous essayons de charger d'abord le cache, puis on récupère en ligne.
    controller.loadCachedData();
    controller.fetchData();

    return Scaffold(
      appBar: AppBar(title: Text(className), backgroundColor: currentColor),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(color: Colors.green.shade800),
          );
        }
        if (controller.data.isEmpty) {
          return Center(
            child: Text(
              "Aucune donnée disponible.",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            // Ici, nous supposons que chaque élément de 'data' correspond à une "classe" à afficher.
            // Vous pouvez adapter l'extraction des données en fonction de votre structure JSON.
            final classe = controller.data[index];
            return ClasseCard(
              // On suppose que 'classe' contient un attribut 'nom'.
              // Si vous avez un modèle spécifique, vous pouvez convertir la map en instance de votre modèle.
              classe: classe,
              currentColor: currentColor,
            );
          },
        );
      }),
    );
  }
}
