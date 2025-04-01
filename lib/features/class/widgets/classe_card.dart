import 'package:flutter/material.dart';
import 'matiere_title.dart'; // Par exemple, votre widget pour afficher le titre d'une matière.

class ClasseCard extends StatelessWidget {
  final Map classe; // On attend une Map représentant la classe
  final Color currentColor;

  const ClasseCard({
    super.key,
    required this.classe,
    required this.currentColor,
  });

  @override
  Widget build(BuildContext context) {
    // On suppose que 'classe' contient un attribut 'nom' et une liste 'matieres'
    return Card(
      margin: const EdgeInsets.all(8),
      child: ExpansionTile(
        leading: const Icon(Icons.school),
        title: Text(
          classe['nom'] ?? 'Nom indisponible',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
        children:
            (classe['matieres'] as List<dynamic>?)
                ?.map(
                  (matiere) => MatiereTile(
                    // Ici, on passe directement la Map 'matiere' à votre widget.
                    matiere: matiere,
                    currentColor: currentColor,
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
