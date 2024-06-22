import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/studyLevel.dart';

part 'study_level_event.dart';
part 'study_level_state.dart';

class StudyLevelBloc extends Bloc<StudyLevelEvent, StudyLevelState> {
  StudyLevelBloc() : super(Empty()) {
    on<StudyLevelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
