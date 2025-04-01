import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/chapitre_model.dart';

class ChapitreTile extends StatelessWidget {
  final ChapitreModel chapitre;
  final Color currentColor;

  const ChapitreTile({
    super.key,
    required this.chapitre,
    required this.currentColor,
  });

  Future<void> _launchURL() async {
    final url = chapitre.fichierPdf;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Affiche une erreur si l'URL ne peut être lancée
      throw 'Impossible d\'ouvrir le lien $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.picture_as_pdf),
      title: Text(
        chapitre.titre,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.grey.shade800,
        ),
      ),
      children: [
        ListTile(
          title: const Text('Voir PDF'),
          trailing: Icon(Icons.open_in_new, color: currentColor),
          onTap: _launchURL,
        ),
        ListTile(
          title: const Text('Détails du chapitre'),
          subtitle: const Text(
            'Ajoutez ici des informations supplémentaires sur le chapitre.',
          ),
        ),
      ],
    );
  }
}
