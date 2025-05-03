class DocumentModel {
  final int id;
  final String titre;
  final String description;
  final String fichierPdf;
  final String categorie;
  final DateTime date;
  final int classe;
  final String author;

  DocumentModel({
    required this.id,
    required this.titre,
    required this.description,
    required this.fichierPdf,
    required this.categorie,
    required this.date,
    required this.classe,
    required this.author,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'],
      titre: json['titre'],
      description: json['description'],
      fichierPdf: json['fichier_pdf'],
      categorie: json['categorie'],
      date: DateTime.parse(json['date']),
      classe: json['classe'],
      author: json['author'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'description': description,
      'fichier_pdf': fichierPdf,
      'categorie': categorie,
      'date': date.toIso8601String(),
      'classe': classe,
      'author': author,
    };
  }
}
