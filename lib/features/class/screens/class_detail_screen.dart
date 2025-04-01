import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart' show SfPdfViewer;

import '../../../models/chapitre_model.dart';

class ChapterDetailPage extends StatefulWidget {
  final ChapitreModel chapitre;

  const ChapterDetailPage({super.key, required this.chapitre});

  @override
  State<ChapterDetailPage> createState() => _ChapterDetailPageState();
}

class _ChapterDetailPageState extends State<ChapterDetailPage> {
  bool _isLoadingPdf = true;
  bool _hasError = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final fileUrl = widget.chapitre.fichierPdf;
    final isPdf = fileUrl.toLowerCase().endsWith('.pdf');

    // Log de vérification de l'URL
    debugPrint("URL du fichier : $fileUrl");

    return Scaffold(
      appBar: AppBar(title: Text(widget.chapitre.titre)),
      body: Stack(
        children: [
          Center(
            child:
                isPdf
                    ? SfPdfViewer.network(
                      fileUrl,
                      onDocumentLoaded: (details) {
                        debugPrint("PDF chargé avec succès");
                        setState(() {
                          _isLoadingPdf = false;
                        });
                      },
                      onDocumentLoadFailed: (error) {
                        debugPrint("Erreur lors du chargement du PDF : $error");
                        setState(() {
                          _isLoadingPdf = false;
                          _hasError = true;
                          _errorMessage = "Erreur de chargement du PDF";
                        });
                      },
                    )
                    : Image.network(
                      fileUrl,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        // Log de progression de chargement pour l'image
                        debugPrint("Chargement de l'image en cours...");
                        return Center(
                          child: CircularProgressIndicator(
                            value:
                                loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        debugPrint(
                          "Erreur lors du chargement de l'image : $error",
                        );
                        return const Center(
                          child: Text('Erreur de chargement de l\'image'),
                        );
                      },
                    ),
          ),
          // Affichage de l'indicateur de chargement pour le PDF
          if (isPdf && _isLoadingPdf)
            const Center(child: CircularProgressIndicator()),
          // Affichage d'un message d'erreur si besoin
          if (_hasError)
            Center(
              child: Container(
                color: Colors.grey.shade300,
                padding: const EdgeInsets.all(16),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
