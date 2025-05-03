import 'package:hive/hive.dart';
import 'subject_model.dart';

part 'school_class_model.g.dart'; // Nom corrigé

@HiveType(typeId: 1)
class SchoolClassModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String nom;

  @HiveField(2)
  final List<SubjectModel> matieres;

  @HiveField(3)
  final String author;

  SchoolClassModel({
    required this.id,
    required this.nom,
    required this.matieres,
    required this.author,
  });

  factory SchoolClassModel.fromJson(Map<String, dynamic> json) {
    return SchoolClassModel(
      id: json['id'],
      nom: json['nom'],
      matieres: List<SubjectModel>.from(
        json['matieres'].map((x) => SubjectModel.fromJson(x)),
      ),
      author: json['author'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nom': nom,
    'matieres': matieres.map((x) => x.toJson()).toList(),
    'author': author,
  };
}
