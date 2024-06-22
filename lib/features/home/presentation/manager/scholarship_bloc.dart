import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/features/home/domain/entities/sholarship.dart';

import '../../../../global/utils/map_failure_message.dart';
import '../../domain/usecases/find_scholarship.dart';

part 'scholarship_event.dart';
part 'scholarship_state.dart';

class ScholarshipBloc extends Bloc<ScholarshipEvent, ScholarshipState> {

  final FindScholarship findScholarship;

  ScholarshipBloc(this.findScholarship) : super(Empty()) {
    on<SearchScholarship>(_searchScholarship);
  }
  Future<void> _searchScholarship(SearchScholarship event,Emitter emit)async {
      emit(Loading());
      final response = await findScholarship(Params(location: event.country, studyLevel: event.studyLevel, studyField: event.query));
      response?.fold((failure){
        emit(ErrorState(message: mapFailureToMessage(failure)));
      }, (scholarships){
        emit(Loaded(scholarships: scholarships));
      });
  }
}
