import 'package:hive/hive.dart';
import 'chapitre_model.dart';

part 'matiere_model.g.dart';

@HiveType(typeId: 1)
class MatiereModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String nom;

  @HiveField(2)
  final int classeId;

  @HiveField(3)
  final List<ChapitreModel> chapitres;

  MatiereModel({
    required this.id,
    required this.nom,
    required this.classeId,
    this.chapitres = const [],
  });

  factory MatiereModel.fromJson(Map<String, dynamic> json) {
    return MatiereModel(
      id: json['id'],
      nom: json['nom'],
      classeId: json['classe']['id'],
      chapitres:
          (json['chapitres'] as List<dynamic>?)
              ?.map((chapitre) => ChapitreModel.fromJson(chapitre))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'classeId': classeId,
      'chapitres': chapitres.map((chapitre) => chapitre.toJson()).toList(),
    };
  }
}
