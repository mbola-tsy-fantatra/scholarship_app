import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/academic.dart';

part 'academic_event.dart';
part 'academic_state.dart';

class AcademicBloc extends Bloc<AcademicEvent, AcademicState> {
  AcademicBloc() : super(Empty()) {
    on<AcademicEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
