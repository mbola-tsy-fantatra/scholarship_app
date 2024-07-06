import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../global/utils/map_failure_message.dart';
import '../../../../../core/entity/studyLevel.dart';
import '../../../domain/usecases/get_study_level.dart';

part 'study_level_event.dart';
part 'study_level_state.dart';

class StudyLevelBloc extends Bloc<StudyLevelEvent, StudyLevelState> {

  final GetStudyLevels getStudyLevels;

  StudyLevelBloc(this.getStudyLevels) : super(Empty()) {
    on<GetStudyLevelEvent>(_getStudyLevels);
  }

  Future<void> _getStudyLevels(GetStudyLevelEvent event, Emitter emit)async{
    emit(StudyLevelLoading());
    final response = await getStudyLevels(NoParams());
    response?.fold((failure){
      emit(StudyLevelErrorState(message: mapFailureToMessage(failure)));
    }, (studyLevels){
      emit(StudyLevelLoaded(studyLevel: studyLevels));
    });
  }
}
