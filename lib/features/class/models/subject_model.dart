import 'package:hive/hive.dart';
import 'chapter_model.dart';
part 'subject_model.g.dart';

@HiveType(typeId: 2)
class SubjectModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String nom;

  @HiveField(2)
  final List<ChapterModel> chapitres;

  @HiveField(3)
  final String author;

  SubjectModel({
    required this.id,
    required this.nom,
    required this.chapitres,
    required this.author,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      nom: json['nom'],
      chapitres: List<ChapterModel>.from(
        json['chapitres'].map((x) => ChapterModel.fromJson(x)),
      ),
      author: json['author'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nom': nom,
    'chapitres': chapitres.map((x) => x.toJson()).toList(),
    'author': author,
  };
}
