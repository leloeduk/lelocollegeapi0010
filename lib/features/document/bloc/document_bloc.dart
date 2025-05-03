import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lelocollege/services/api/data/api_document.dart';
import 'document_event.dart';
import 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final ApiDocument apiDocument;

  DocumentBloc({required this.apiDocument}) : super(DocumentInitial()) {
    on<FetchDocuments>(_onFetchDocuments);
  }

  Future<void> _onFetchDocuments(
    FetchDocuments event,
    Emitter<DocumentState> emit,
  ) async {
    emit(DocumentLoading());
    try {
      final documents = await apiDocument.fetchDocuments();
      emit(DocumentLoaded(documents: documents));
    } catch (e) {
      emit(DocumentError(error: e.toString()));
    }
  }
}
