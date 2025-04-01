// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../services/api/domain/repos/doc_repos.dart';

// // États
// abstract class ClassState {}

// class ClassInitial extends ClassState {}

// class ClassLoading extends ClassState {}

// class ClassLoaded extends ClassState {
//   final List<dynamic> data;

//   ClassLoaded(this.data);
// }

// class ClassError extends ClassState {
//   final String message;

//   ClassError(this.message);
// }

// // Cubit
// class ClassCubit extends Cubit<ClassState> {
//   final DocRepo repository;

//   ClassCubit(this.repository) : super(ClassInitial());

//   Future<void> fetchClassContent(String className) async {
//     try {
//       emit(ClassLoading());
//       final chapters = await repository.fetchChapters();

//       // Filtrer les chapitres correspondant à la classe sélectionnée
//       final filteredChapters =
//           chapters
//               .where(
//                 (chapter) => chapter['matiere']['classe']['nom'] == className,
//               )
//               .toList();

//       emit(ClassLoaded(filteredChapters));
//     } catch (e) {
//       emit(ClassError("Erreur : ${e.toString()}"));
//     }
//   }
// }
