import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart'; // Pour afficher les PDF
import '../../../services/api/data/data_repository.dart';
import '../../../models/chapitre_model.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final DatasRepository dataRepo = DatasRepository();
  List<ChapitreModel> chapitres = []; // Liste des chapitres
  bool isLoading = true; // Indicateur de chargement
  String? errorMessage; // Message d'erreur

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    _fetchData(); // Récupérer les données au démarrage
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // Récupérer les données en ligne avec fallback offline
  Future<void> _fetchData() async {
    try {
      final data = await dataRepo.fetchAllDatas();
      setState(() {
        chapitres = data["chapitres"] as List<ChapitreModel>;
        isLoading = false;
      });
    } catch (e) {
      // Si la récupération en ligne échoue, on affiche le message d'erreur
      setState(() {
        isLoading = false;
        errorMessage = 'Erreur lors du chargement des données: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Barre d'onglets
            Container(
              height: 60,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(4),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: TabBar(
                controller: tabController,
                padding: const EdgeInsets.all(8),
                labelPadding: const EdgeInsets.all(8),
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  color: Colors.green,
                ),
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Guides"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Livres"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Pédagogiques"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Autres"),
                  ),
                ],
              ),
            ),
            // Contenu des onglets
            Expanded(
              child:
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : errorMessage != null
                      ? Center(child: Text(errorMessage!))
                      : TabBarView(
                        controller: tabController,
                        children: [
                          _buildChapitreList('Guides'),
                          _buildChapitreList('Livres'),
                          _buildChapitreList('Pédagogiques'),
                          _buildChapitreList('Autres'),
                        ],
                      ),
            ),
          ],
        ),
      ),
    );
  }

  // Filtrer et afficher la liste des chapitres pour une catégorie donnée
  Widget _buildChapitreList(String category) {
    final filteredChapitres =
        chapitres
            .where(
              (chapitre) =>
                  chapitre.categorie.toLowerCase() == category.toLowerCase(),
            )
            .toList();

    if (filteredChapitres.isEmpty) {
      return Center(
        child: Text(
          "Aucun document disponible dans la catégorie \"$category\"",
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredChapitres.length,
      itemBuilder: (context, index) {
        final chapitre = filteredChapitres[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(
              Icons.picture_as_pdf,
              size: 40,
              color: Colors.green,
            ),
            title: Text(chapitre.titre),
            subtitle: Text("Matière: ${chapitre.matiereId}"),
            onTap: () {
              _openPdf(context, chapitre.fichierPdf); // Ouvrir le PDF
            },
          ),
        );
      },
    );
  }

  // Ouvrir un fichier PDF dans un nouvel écran
  void _openPdf(BuildContext context, String pdfUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(
                title: const Text("PDF Viewer"),
                backgroundColor: Colors.green,
              ),
              body: SfPdfViewer.network(pdfUrl),
            ),
      ),
    );
  }
}
