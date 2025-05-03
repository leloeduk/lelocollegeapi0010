part of 'class_bloc.dart';

abstract class ClassState {}

class ClassInitial extends ClassState {}

class ClassLoading extends ClassState {}

class ClassLoaded extends ClassState {
  final List<SchoolClassModel> classes;

  ClassLoaded({required this.classes});
}

class ClassError extends ClassState {
  final String error;

  ClassError({required this.error});
}
