import 'package:hive/hive.dart';
import 'matiere_model.dart';

part 'classe_model.g.dart';

@HiveType(typeId: 0)
class ClasseModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String nom;

  @HiveField(2)
  final List<MatiereModel> matieres;

  ClasseModel({required this.id, required this.nom, this.matieres = const []});

  factory ClasseModel.fromJson(Map<String, dynamic> json) {
    return ClasseModel(
      id: json['id'] ?? 0,
      nom: json['nom'] ?? 'Classe inconnue',
      matieres:
          (json['matieres'] as List<dynamic>?)
              ?.map((matiere) => MatiereModel.fromJson(matiere))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'matieres': matieres.map((matiere) => matiere.toJson()).toList(),
    };
  }
}
