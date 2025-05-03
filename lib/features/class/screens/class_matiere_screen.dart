import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/class_bloc.dart';
import '../models/school_class_model.dart';

class ClassMatiereScreen extends StatefulWidget {
  final String className;

  const ClassMatiereScreen({super.key, required this.className});

  @override
  State<ClassMatiereScreen> createState() => _ClassMatiereScreenState();
}

class _ClassMatiereScreenState extends State<ClassMatiereScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ClassBloc>().add(FetchClasses());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.className,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade700, Colors.green.shade200],
          ),
        ),
        child: BlocBuilder<ClassBloc, ClassState>(
          builder: (context, state) {
            if (state is ClassLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            } else if (state is ClassLoaded) {
              final classe = state.classes.firstWhere(
                (c) => c.nom == widget.className,
                orElse:
                    () => SchoolClassModel(
                      id: -1,
                      nom: '',
                      matieres: [],
                      author: '',
                    ),
              );

              if (classe.id == -1) {
                return Center(
                  child: Text(
                    'Classe non trouvée',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView(
                  children:
                      classe.matieres.map((matiere) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ExpansionTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green.shade100,
                                child: Text(
                                  matiere.nom.substring(0, 1),
                                  style: TextStyle(
                                    color: Colors.green.shade800,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Text(
                                matiere.nom,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              children:
                                  matiere.chapitres.map((chapitre) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 24,
                                            ),
                                        leading: Icon(
                                          Icons.bookmark_border,
                                          color: Colors.green.shade600,
                                        ),
                                        title: Text(
                                          chapitre.titre,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle:
                                            chapitre.fichierPdf.isNotEmpty
                                                ? Text(
                                                  'PDF disponible',
                                                  style: TextStyle(
                                                    color:
                                                        Colors.green.shade600,
                                                  ),
                                                )
                                                : Text(
                                                  'Pas de fichier PDF',
                                                  style: TextStyle(
                                                    color: Colors.grey.shade600,
                                                  ),
                                                ),
                                        trailing:
                                            chapitre.fichierPdf.isNotEmpty
                                                ? Icon(
                                                  Icons.lock_open,
                                                  color: Colors.green.shade600,
                                                )
                                                : Icon(
                                                  Icons.lock_outline,
                                                  color: Colors.grey.shade400,
                                                ),
                                        onTap: () {
                                          if (chapitre.fichierPdf.isNotEmpty) {
                                            // Ouvrir le PDF
                                          }
                                        },
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              );
            } else if (state is ClassError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Erreur de chargement',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.error,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ClassBloc>().add(FetchClasses());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        'Réessayer',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Text(
                'Prêt à charger',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
