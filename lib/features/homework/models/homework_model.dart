class HomeworkModel {
  final int id;
  final String titre;
  final String description;
  final int matiere;
  final String fichierPdf;
  final String date;
  final String annee;
  final int classe;
  final String categorie;
  final String enseignant;

  HomeworkModel({
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

  factory HomeworkModel.fromJson(Map<String, dynamic> json) {
    return HomeworkModel(
      id: json['id'],
      titre: json['titre'],
      description: json['description'],
      matiere: json['matiere'],
      fichierPdf: json['fichier_pdf'],
      date: json['date'],
      annee: json['annee'],
      classe: json['classe'],
      categorie: json['categorie'],
      enseignant: json['enseignant'],
    );
  }
}
