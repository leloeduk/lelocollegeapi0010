abstract class HomeworkState {}

class HomeworkInitial extends HomeworkState {}

class HomeworkLoading extends HomeworkState {}

class HomeworkLoaded extends HomeworkState {
  final List<dynamic> homeworks;

  HomeworkLoaded({required this.homeworks});
}

class HomeworkError extends HomeworkState {
  final String error;

  HomeworkError({required this.error});
}
