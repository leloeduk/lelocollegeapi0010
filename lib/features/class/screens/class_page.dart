// import 'package:flutter/material.dart';
// import '../../../core/utils/app_colors.dart';
// import '../../../services/api/data/api_service.dart'; // Ton DataRepository

// class ClassPage extends StatefulWidget {
//   final String className;
//   final Color currentColor;

//   const ClassPage({
//     super.key,
//     required this.className,
//     required this.currentColor,
//   });

//   @override
//   State<ClassPage> createState() => _ClassPageState();
// }

// class _ClassPageState extends State<ClassPage> {
//   late Future<List<dynamic>> _chaptersFuture;

//   @override
//   void initState() {
//     super.initState(); // Toujours appeler super.initState()
//     _chaptersFuture = DataRepository().fetchChapters(); // Initialisation ici
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           widget.className,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             fontSize: 20,
//           ),
//         ),
//         backgroundColor: widget.currentColor,
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: _chaptersFuture,
//         builder: (context, snapshot) {
//           // Affiche un loader pendant le chargement
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           // Affiche un message en cas d’erreur
//           if (snapshot.hasError) {
//             return Center(child: Text("Erreur : ${snapshot.error}"));
//           }

//           // Récupère la liste de chapitres
//           final chapters = snapshot.data ?? [];

//           // Construit la liste
//           return ListView.builder(
//             itemCount: chapters.length,
//             itemBuilder: (context, index) {
//               final chapter = chapters[index];

//               // Structure du JSON de chaque chapitre (selon ton API Django) :
//               // {
//               //   "id": 1,
//               //   "titre": "Nombres entiers naturels",
//               //   "matiere": {
//               //     "id": 1,
//               //     "nom": "Mathématiques",
//               //     "classe": {
//               //       "id": 1,
//               //       "nom": "6ème",
//               //       "author": 1
//               //     },
//               //     "author": 1
//               //   },
//               //   "fichier_pdf": "...",
//               //   "author": 1
//               // }

//               final titre = chapter['titre'] ?? 'Chapitre sans titre';
//               final matiere = chapter['matiere'];
//               final matiereNom = matiere != null ? matiere['nom'] ?? '' : '';
//               final classeNom =
//                   matiere != null && matiere['classe'] != null
//                       ? matiere['classe']['nom'] ?? ''
//                       : '';
//               final pdfUrl = chapter['fichier_pdf'] ?? '';

//               return Card(
//                 margin: const EdgeInsets.all(10),
//                 child: ExpansionTile(
//                   leading: Icon(Icons.book, color: widget.currentColor),
//                   title: Text(
//                     titre,
//                     style: const TextStyle(color: AppColors.black),
//                   ),
//                   subtitle: Text("Matière: $matiereNom | Classe: $classeNom"),
//                   trailing: const Icon(
//                     Icons.keyboard_double_arrow_down_sharp,
//                     size: 30,
//                     color: AppColors.black,
//                   ),
//                   children: [
//                     ListTile(
//                       title: Text("ID: ${chapter['id']}"),
//                       subtitle: Text("PDF: $pdfUrl"),
//                       onTap: () {
//                         // Exemple de navigation vers une page de détails
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder:
//                                 (context) => ChapterPage(
//                                   chapterName: titre,
//                                   pdfUrl: pdfUrl,
//                                   currentColor: widget.currentColor,
//                                 ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class ChapterPage extends StatelessWidget {
//   final String chapterName;
//   final String pdfUrl;
//   final Color currentColor;

//   const ChapterPage({
//     super.key,
//     required this.chapterName,
//     required this.pdfUrl,
//     required this.currentColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(chapterName), backgroundColor: currentColor),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Voici le PDF :',
//               style: const TextStyle(color: AppColors.black, fontSize: 18),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               pdfUrl.isNotEmpty ? pdfUrl : 'Aucun PDF disponible',
//               style: const TextStyle(color: AppColors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
