import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/features/connection/domain/entities/connection_sender.dart';

import '../../../../../global/utils/map_failure_message.dart';
import '../../../domain/usecases/get_connection_request_sent.dart';

part 'connection_sent_event.dart';
part 'connection_sent_state.dart';

class ConnectionSentBloc extends Bloc<ConnectionSentEvent, ConnectionSentState> {

  final GetConnectionRequestSent getConnectionRequestSent;

  ConnectionSentBloc({required this.getConnectionRequestSent}) : super(EmptyState()) {
    on<GetConnectionRequestSentEvent>(_getConnectionSentList);

  }

  Future<void> _getConnectionSentList(GetConnectionRequestSentEvent event, Emitter emit)async{
    emit(Loading());
    final response = await getConnectionRequestSent(GetConnectionParams(limit: event.limit, page: event.page));
    response.fold((failure){
      emit(ErrorState(message: mapFailureToMessage(failure)));
    }, (connections){
      emit(connections);
    });
  }

}
