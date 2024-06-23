part of 'study_level_bloc.dart';

abstract class StudyLevelState extends Equatable {
  const StudyLevelState();
}

class Empty extends StudyLevelState {
  @override
  List<Object> get props => [];
}

class StudyLevelLoading extends StudyLevelState {

  @override
  List<Object?> get props => [];
}

class StudyLevelLoaded extends StudyLevelState {
  final List<StudyLevel> studyLevel;
  const StudyLevelLoaded({required this.studyLevel});

  @override
  List<Object?> get props => [studyLevel];
}

class StudyLevelErrorState extends StudyLevelState {
  final String message;
  const StudyLevelErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
