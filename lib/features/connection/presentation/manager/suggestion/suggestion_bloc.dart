
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/connection/domain/entities/user_profile.dart';

import '../../../../../global/utils/map_failure_message.dart';
import '../../../domain/usecases/get_connection_suggestion.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {

  final GetConnectionSuggestion getSuggestion;

  SuggestionBloc({required this.getSuggestion}) : super(Empty()) {
    on<GetSuggestionEvent>(_getSuggestion);
  }


  Future<void> _getSuggestion(GetSuggestionEvent event ,Emitter emit)async {
      emit(Loading());
      final response = await getSuggestion(NoParams());
      response.fold((failure){
        emit(ErrorState(message: mapFailureToMessage(failure)));
      }, (suggestions){
        emit(Loaded(profiles: suggestions));
      });
  }

}
