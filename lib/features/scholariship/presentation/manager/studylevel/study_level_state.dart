part of 'study_level_bloc.dart';

abstract class StudyLevelState extends Equatable {
  const StudyLevelState();
}

class Empty extends StudyLevelState {
  @override
  List<Object> get props => [];
}

class Loading extends StudyLevelState {

  @override
  List<Object?> get props => [];
}

class Loaded extends StudyLevelState {
  final StudyLevel studyLevel;
  const Loaded({required this.studyLevel});

  @override
  List<Object?> get props => [studyLevel];
}

class ErrorState extends StudyLevelState {
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
