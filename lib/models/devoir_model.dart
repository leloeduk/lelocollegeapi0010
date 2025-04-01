import 'package:hive/hive.dart';
import 'classe_model.dart';
import 'matiere_model.dart';

part 'devoir_model.g.dart';

@HiveType(typeId: 3)
class DevoirModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String titre;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final MatiereModel matiere;

  @HiveField(4)
  final String fichierPdf;

  @HiveField(5)
  final String date;

  @HiveField(6)
  final String annee;

  @HiveField(7)
  final ClasseModel classe;

  @HiveField(8)
  final String categorie;

  @HiveField(9)
  final String enseignant;

  DevoirModel({
    required this.id,
    required this.titre,
    required this.description,
    required this.matiere,
    required this.fichierPdf,
    required this.date,
    required this.annee,
    required this.classe,
    required this.categorie,
    required this.enseignant,
  });

  factory DevoirModel.fromJson(Map<String, dynamic> json) {
    return DevoirModel(
      id: json['id'],
      titre: json['titre'],
      description: json['description'],
      matiere: MatiereModel.fromJson(json['matiere']),
      fichierPdf: json['fichier_pdf'],
      date: json['date'],
      annee: json['annee'],
      classe: ClasseModel.fromJson(json['classe']),
      categorie: json['categorie'],
      enseignant: json['enseignant'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'description': description,
      'matiere': matiere.toJson(),
      'fichier_pdf': fichierPdf,
      'date': date,
      'annee': annee,
      'classe': classe.toJson(),
      'categorie': categorie,
      'enseignant': enseignant,
    };
  }
}
