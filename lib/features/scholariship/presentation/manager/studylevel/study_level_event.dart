part of 'study_level_bloc.dart';

abstract class StudyLevelEvent extends Equatable {
  const StudyLevelEvent();
}

class GetStudyLevelEvent extends StudyLevelEvent{
  @override
  List<Object?> get props => [];

}