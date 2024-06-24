import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../global/utils/map_failure_message.dart';
import '../../../domain/entities/academic.dart';
import '../../../domain/usecases/get_academics.dart';

part 'academic_event.dart';
part 'academic_state.dart';

class AcademicBloc extends Bloc<AcademicEvent, AcademicState> {
  final GetAcademics getAcademics;

  AcademicBloc(this.getAcademics) : super(Empty()) {
    on<GetAcademicEvent>(_getAcademics);
  }

  Future<void> _getAcademics(GetAcademicEvent event, Emitter emit)async{
    emit(Loading());
    final response = await getAcademics(NoParams());
    response?.fold((failure){
      emit(ErrorState(message: mapFailureToMessage(failure)));
    }, (academics){
      emit(Loaded(academics:academics));
    });
  }
}
