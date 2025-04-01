// import 'package:hive/hive.dart';

// part 'classe_model.g.dart';

// @HiveType(typeId: 0)
// class ClasseModel {
//   @HiveField(0)
//   final int id;
//   @HiveField(1)
//   final String nom;
//   @HiveField(2)
//   final List<MatiereModel> matieres;

//   ClasseModel({required this.id, required this.nom, this.matieres = const []});

//   factory ClasseModel.fromJson(Map<String, dynamic> json) {
//     return ClasseModel(
//       id: json['id'] ?? 0,
//       nom: json['nom'] ?? 'Classe inconnue',
//       matieres: (json['matieres'] as List<dynamic>?)
//               ?.map((matiere) => MatiereModel.fromJson(matiere))
//               .toList() ??
//           [],
//     );
//   }
// }

// part 'matiere_model.g.dart';
// @HiveType(typeId: 1)
// class MatiereModel {
//   @HiveField(0)
//   final int id;
//   @HiveField(1)
//   final String nom;
//   @HiveField(2)
//   final int classeId;
//   @HiveField(3)
//   final List<ChapitreModel> chapitres;

//   MatiereModel({required this.id, required this.nom, required this.classeId, this.chapitres = const []});

//   factory MatiereModel.fromJson(Map<String, dynamic> json) {
//     return MatiereModel(
//       id: json['id'],
//       nom: json['nom'],
//       classeId: json['classe']['id'],
//     );
//   }
// }

// part 'chapitre_model.g.dart';

// @HiveType(typeId: 2)
// class ChapitreModel {
//   @HiveField(0)
//   final int id;
//   @HiveField(1)
//   final String titre;
//   @HiveField(2)
//   final String fichierPdf;
//   @HiveField(3)
//   final int matiereId;
//   @HiveField(4)
//   final String categorie;

//   ChapitreModel({required this.id, required this.titre, required this.fichierPdf, required this.matiereId, required this.categorie});

//   factory ChapitreModel.fromJson(Map<String, dynamic> json) {
//     return ChapitreModel(
//       id: json['id'] ?? 0,
//       titre: json['titre'] ?? 'Titre inconnu',
//       fichierPdf: json['fichier_pdf'] ?? 'Aucun fichier',
//       matiereId: json['matiere']?['id'] ?? 0,
//       categorie: json['categorie'] ?? 'Non catégorisé',
//     );
//   }
// }

// part 'devoir_model.g.dart';

// @HiveType(typeId: 3)
// class DevoirModel {
//   @HiveField(0)
//   final int id;
//   @HiveField(1)
//   final String titre;
//   @HiveField(2)
//   final String description;
//   @HiveField(3)
//   final MatiereModel matiere;
//   @HiveField(4)
//   final String fichierPdf;
//   @HiveField(5)
//   final String date;
//   @HiveField(6)
//   final String annee;
//   @HiveField(7)
//   final ClasseModel classe;
//   @HiveField(8)
//   final String categorie;
//   @HiveField(9)
//   final String enseignant;

//   DevoirModel({
//     required this.id,
//     required this.titre,
//     required this.description,
//     required this.matiere,
//     required this.fichierPdf,
//     required this.date,
//     required this.annee,
//     required this.classe,
//     required this.categorie,
//     required this.enseignant,
//   });

//   factory DevoirModel.fromJson(Map<String, dynamic> json) {
//     return DevoirModel(
//       id: json['id'],
//       titre: json['titre'],
//       description: json['description'],
//       matiere: MatiereModel.fromJson(json['matiere']),
//       fichierPdf: json['fichier_pdf'],
//       date: json['date'],
//       annee: json['annee'],
//       classe: ClasseModel.fromJson(json['classe']),
//       categorie: json['categorie'],
//       enseignant: json['enseignant'],
//     );
//   }
// }
