import 'package:hive/hive.dart';

part 'chapitre_model.g.dart';

@HiveType(typeId: 2)
class ChapitreModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String titre;

  @HiveField(2)
  final String fichierPdf;

  @HiveField(3)
  final int matiereId;

  @HiveField(4)
  final String categorie;

  ChapitreModel({
    required this.id,
    required this.titre,
    required this.fichierPdf,
    required this.matiereId,
    required this.categorie,
  });

  factory ChapitreModel.fromJson(Map<String, dynamic> json) {
    return ChapitreModel(
      id: json['id'],
      titre: json['titre'],
      fichierPdf: json['fichier_pdf'],
      matiereId: json['matiere_id'],
      categorie: json['categorie'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'fichier_pdf': fichierPdf,
      'matiere_id': matiereId,
      'categorie': categorie,
    };
  }
}
