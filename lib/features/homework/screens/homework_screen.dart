import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/homework_bloc.dart';
import '../bloc/homework_event.dart';
import '../bloc/homework_state.dart';
import '../models/homework_model.dart';

class HomeworkScreen extends StatefulWidget {
  @override
  _HomeworkScreenState createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeworkBloc>().add(FetchHomeworks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste des Devoirs')),
      body: BlocBuilder<HomeworkBloc, HomeworkState>(
        builder: (context, state) {
          if (state is HomeworkLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeworkLoaded) {
            final homeworks = state.homeworks;

            // Grouper les devoirs par catégorie
            final grouped = <String, List<HomeworkModel>>{};
            for (var hw in homeworks) {
              grouped.putIfAbsent(hw.categorie, () => []).add(hw);
            }

            return ListView(
              children:
                  grouped.entries.map((entry) {
                    return ExpansionTile(
                      title: Text(
                        entry.key.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children:
                          entry.value.map((homework) {
                            return ListTile(
                              title: Text(homework.titre),
                              subtitle: Text(homework.description),
                              trailing: IconButton(
                                icon: Icon(Icons.picture_as_pdf),
                                onPressed: () {
                                  // Tu peux utiliser url_launcher pour ouvrir le PDF
                                  // launch(homework.fichierPdf);
                                },
                              ),
                            );
                          }).toList(),
                    );
                  }).toList(),
            );
          } else if (state is HomeworkError) {
            return Center(child: Text("Erreur : ${state.error}"));
          } else {
            return Center(child: Text("Aucun devoir trouvé."));
          }
        },
      ),
    );
  }
}
