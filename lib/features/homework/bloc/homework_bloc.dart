import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lelocollege/services/api/data/api_homework.dart';
import 'homework_event.dart';
import 'homework_state.dart';

class HomeworkBloc extends Bloc<HomeworkEvent, HomeworkState> {
  final ApiHomework apiHomework;

  HomeworkBloc({required this.apiHomework}) : super(HomeworkInitial()) {
    on<FetchHomeworks>(_onFetchHomeworks);
  }

  Future<void> _onFetchHomeworks(
    FetchHomeworks event,
    Emitter<HomeworkState> emit,
  ) async {
    emit(HomeworkLoading());
    try {
      final homeworks = await apiHomework.fetchHomeworks();
      emit(HomeworkLoaded(homeworks: homeworks));
    } catch (e) {
      emit(HomeworkError(error: e.toString()));
    }
  }
}
