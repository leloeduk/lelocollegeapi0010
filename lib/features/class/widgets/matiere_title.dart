import 'package:flutter/material.dart';
import '../../../models/matiere_model.dart';
import 'chapitre_title.dart';

class MatiereTile extends StatelessWidget {
  final MatiereModel matiere;
  final Color currentColor;

  const MatiereTile({
    super.key,
    required this.matiere,
    required this.currentColor,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.book, color: currentColor),
      title: Text(
        matiere.nom,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      children:
          matiere.chapitres
              .map(
                (chapitre) => ChapitreTile(
                  chapitre: chapitre,
                  currentColor: currentColor,
                ),
              )
              .toList(),
    );
  }
}
