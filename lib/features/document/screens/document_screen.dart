import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../bloc/document_bloc.dart';
import '../bloc/document_event.dart';
import '../bloc/document_state.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _categories = [
    'guides',
    'livres',
    'pedagogiques',
    'autres',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
    context.read<DocumentBloc>().add(FetchDocuments());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // En-tête personnalisé
          Container(
            padding: const EdgeInsets.only(
              top: 40,
              left: 16,
              right: 16,
              bottom: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Documents',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildTabBar(),
              ],
            ),
          ),
          // Contenu principal
          Expanded(
            child: BlocBuilder<DocumentBloc, DocumentState>(
              builder: (context, state) {
                if (state is DocumentLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is DocumentError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.error,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed:
                              () => context.read<DocumentBloc>().add(
                                FetchDocuments(),
                              ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade700,
                          ),
                          child: const Text(
                            'Réessayer',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (state is DocumentLoaded) {
                  return TabBarView(
                    controller: _tabController,
                    children:
                        _categories.map((category) {
                          return _buildDocumentList(state.documents, category);
                        }).toList(),
                  );
                }

                return const Center(child: Text('Charger les documents'));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        labelColor: Colors.green.shade800,
        unselectedLabelColor: Colors.white,
        tabs:
            _categories.map((category) {
              return Tab(text: _capitalize(category));
            }).toList(),
      ),
    );
  }

  Widget _buildDocumentList(List<dynamic> documents, String category) {
    final filteredDocs =
        documents.where((doc) => doc['categorie'] == category).toList();

    if (filteredDocs.isEmpty) {
      return Center(
        child: Text(
          'Aucun document dans la catégorie ${_capitalize(category)}',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredDocs.length,
      itemBuilder: (context, index) {
        final document = filteredDocs[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.picture_as_pdf,
                size: 30,
                color: Colors.red,
              ),
            ),
            title: Text(
              document['titre'] ?? 'Sans titre',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date: ${document['date']}',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                  if (document['description'] != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        document['description']!,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.green.shade700),
            onTap: () => _openPdf(context, document['fichier_pdf']),
          ),
        );
      },
    );
  }

  void _openPdf(BuildContext context, String? pdfUrl) {
    if (pdfUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Aucun fichier PDF disponible'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              backgroundColor: Colors.grey.shade100,
              body: SafeArea(
                child: Column(
                  children: [
                    // En-tête personnalisé pour le visualiseur PDF
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const Text(
                            'Document PDF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: _buildPdfViewer(pdfUrl)),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget _buildPdfViewer(String pdfUrl) {
    return FutureBuilder(
      future: _initializePdfViewer(pdfUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erreur: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return snapshot.data!;
        }
        return Center(
          child: CircularProgressIndicator(color: Colors.green.shade700),
        );
      },
    );
  }

  Future<Widget> _initializePdfViewer(String pdfUrl) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return SfPdfViewer.network(
      pdfUrl,
      canShowScrollHead: false,
      canShowScrollStatus: true,
    );
  }

  String _capitalize(String input) {
    return "${input[0].toUpperCase()}${input.substring(1)}";
  }
}
