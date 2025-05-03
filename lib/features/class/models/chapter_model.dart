import 'package:hive/hive.dart';

part 'chapter_model.g.dart';

@HiveType(typeId: 3)
class ChapterModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String titre;

  @HiveField(2)
  final String fichierPdf;

  @HiveField(3)
  final String author;

  ChapterModel({
    required this.id,
    required this.titre,
    required this.fichierPdf,
    required this.author,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'],
      titre: json['titre'],
      fichierPdf: json['fichier_pdf'],
      author: json['author'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'titre': titre,
    'fichier_pdf': fichierPdf,
    'author': author,
  };
}
