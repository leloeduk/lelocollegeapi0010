// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import '../../../../models/chapitre_model.dart';
// import '../../../../services/api/data/data_repository.dart';

// class BepecSubjectScreen extends StatefulWidget {
//   const BepecSubjectScreen({super.key});

//   @override
//   State<BepecSubjectScreen> createState() => _BepecSubjectScreenState();
// }

// class _BepecSubjectScreenState extends State<BepecSubjectScreen> {
//   late Future<List<ChapitreModel>> _chapitresFuture;

//   @override
//   void initState() {
//     super.initState();
//     _chapitresFuture = _fetchBepecChapitres();
//   }

//   // Récupère toutes les données et filtre les chapitres du sujet BEPEC
//   Future<List<ChapitreModel>> _fetchBepecChapitres() async {
//     final data = await DatasRepository().fetchAllDatas();
//     final List<ChapitreModel> chapitres =
//         data['chapitres'] as List<ChapitreModel>;
//     // On suppose que le champ 'categorie' contient "bepec" pour le sujet BEPEC
//     return chapitres
//         .where((chap) => chap.categorie.toLowerCase() == 'bepec')
//         .toList();
//   }

//   // Ouvre le PDF dans un nouvel écran
//   void _openPdf(String pdfUrl) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder:
//             (_) => Scaffold(
//               appBar: AppBar(
//                 title: const Text('Sujet BEPEC'),
//                 backgroundColor: Colors.green,
//               ),
//               body: SfPdfViewer.network(pdfUrl),
//             ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sujet BEPEC"),
//         backgroundColor: Colors.green,
//       ),
//       body: FutureBuilder<List<ChapitreModel>>(
//         future: _chapitresFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // Affiche un indicateur pendant le chargement
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(
//               child: Text("Erreur lors du chargement : ${snapshot.error}"),
//             );
//           }
//           final bepecChapitres = snapshot.data ?? [];
//           if (bepecChapitres.isEmpty) {
//             return const Center(child: Text("Aucun sujet BEPEC disponible."));
//           }
//           return ListView.builder(
//             itemCount: bepecChapitres.length,
//             itemBuilder: (context, index) {
//               final chapitre = bepecChapitres[index];
//               return Card(
//                 margin: const EdgeInsets.all(8.0),
//                 child: ListTile(
//                   leading: const Icon(Icons.description, color: Colors.blue),
//                   title: Text(chapitre.titre),
//                   subtitle: Text("Matière: ${chapitre.matiereId}"),
//                   onTap: () {
//                     // Si un fichier PDF est associé, on l'ouvre
//                     if (chapitre.fichierPdf.isNotEmpty) {
//                       _openPdf(chapitre.fichierPdf);
//                     }
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
