// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../models/chapitre_model.dart';
// import '../../../services/api/data/data_cubit.dart';

// class ClassMatiereScreen extends StatefulWidget {
//   final String className; // Paramétrage dynamique de la classe

//   const ClassMatiereScreen({super.key, required this.className});

//   @override
//   State<ClassMatiereScreen> createState() => _ClassMatiereScreenState();
// }

// class _ClassMatiereScreenState extends State<ClassMatiereScreen> {
//   late final ScrollController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _loadData();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   Future<void> _loadData() async {
//     await Future.microtask(() => context.read<DataCubit>().fetchAllData());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.className),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _refreshData,
//             tooltip: 'Actualiser',
//           ),
//         ],
//       ),
//       body: BlocConsumer<DataCubit, DataState>(
//         listener: (context, state) {
//           if (state is DataError) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Erreur: ${state.message}'),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           if (state is DataLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (state is DataLoaded) {
//             final matieres = state.classe.matieres
//                 .where((m) => m.chapitres.isNotEmpty) // Filtre les matières sans chapitres
//                 .toList();

//             if (matieres.isEmpty) {
//               return _buildEmptyState();
//             }

//             return RefreshIndicator(
//               onRefresh: _refreshData,
//               child: ListView.builder(
//                 controller: _scrollController,
//                 itemCount: matieres.length,
//                 itemBuilder: (context, index) {
//                   final matiere = matieres[index];
//                   return Card(
//                     margin: const EdgeInsets.symmetric(
//                       vertical: 4,
//                       horizontal: 8,
//                     ),
//                     child: ExpansionTile(
//                       title: Text(
//                         matiere.nom,
//                         style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                       ),
//                       childrenPadding: const EdgeInsets.only(left: 16),
//                       children: matiere.chapitres.map(_buildChapterItem).toList(),
//                     ),
//                   );
//                 },
//               ),
//             );
//           }

//           if (state is DataError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Erreur de chargement',
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: _refreshData,
//                     child: const Text('Réessayer'),
//                   ),
//                 ],
//               ),
//             );
//           }

//           return _buildEmptyState();
//         },
//       ),
//     );
//   }

//   Widget _buildChapterItem(dynamic chapitre) {
//     final chapitreObj = chapitre is ChapitreModel
//         ? chapitre
//         : ChapitreModel.fromJson(chapitre);

//     return ListTile(
//       title: Text(
//         chapitreObj.titre,
//         style: const TextStyle(fontSize: 15),
//       ),
//       subtitle: Text(
//         chapitreObj.fichierPdf ?? "Aucun fichier disponible",
//         maxLines: 1,
//         overflow: TextOverflow.ellipsis,
//       ),
//       trailing: IconButton(
//         icon: const Icon(Icons.download),
//         onPressed: chapitreObj.fichierPdf != null
//             ? () => _downloadChapter(chapitreObj)
//             : null,
//       ),
//       onTap: chapitreObj.fichierPdf != null
//           ? () => _viewChapter(chapitreObj)
//           : null,
//     );
//   }

//   Widget _buildEmptyState() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.book, size: 64, color: Colors.grey),
//           const SizedBox(height: 16),
//           Text(
//             'Aucun chapitre disponible',
//             style: Theme.of(context).textTheme.titleMedium,
//           ),
//           const SizedBox(height: 8),
//           OutlinedButton(
//             onPressed: _refreshData,
//             child: const Text('Actualiser'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _refreshData() async {
//     await context.read<DataCubit>().fetchAllData();
//   }

//   Future<void> _viewChapter(ChapitreModel chapitre) async {
//     // Implémentez la visualisation du PDF
//   }

//   Future<void> _downloadChapter(ChapitreModel chapitre) async {
//     // Implémentez le téléchargement
//   }
// }
