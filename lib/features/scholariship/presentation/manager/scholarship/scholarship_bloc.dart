import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/features/scholariship/data/request/create_scholarship.dart';
import '../../../../../global/utils/map_failure_message.dart';
import '../../../domain/entities/sholarship.dart';
import '../../../domain/usecases/create_scholarship.dart';
import '../../../domain/usecases/find_scholarship.dart';

part 'scholarship_event.dart';
part 'scholarship_state.dart';

class ScholarshipBloc extends Bloc<ScholarshipEvent, ScholarshipState> {

  final FindScholarship findScholarship;
  final CreateScholarshipCase createScholarship;

  ScholarshipBloc(this.findScholarship,this.createScholarship) : super(Empty()) {
    on<SearchScholarship>(_searchScholarship);
    on<CreateScholarshipEvent>(_createScholarship);
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
  Future<void> _createScholarship(CreateScholarshipEvent event, Emitter<ScholarshipState> emit) async {
    emit(Loading());
    final response = await createScholarship(CreateParams(event.createScholarship));
    response?.fold(
          (failure) {
        emit(ErrorState(message: mapFailureToMessage(failure)));
      },
          (newScholarship) {
        if (state is Loaded) {
          final currentState = state as Loaded;
          final updatedScholarships = List<Scholarship>.from(currentState.scholarships)..add(newScholarship);
          emit(Loaded(scholarships: updatedScholarships));
        } else {
          emit(Loaded(scholarships: [newScholarship]));
        }
      },
    );
  }
}
