abstract class DocumentState {}

class DocumentInitial extends DocumentState {}

class DocumentLoading extends DocumentState {}

class DocumentLoaded extends DocumentState {
  final List<dynamic> documents;

  DocumentLoaded({required this.documents});
}

class DocumentError extends DocumentState {
  final String error;

  DocumentError({required this.error});
}
