import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/features/connection/data/request/connection_request.dart';
import 'package:scholariship/features/connection/domain/usecases/get_connection_request_received.dart';

import '../../../../../global/utils/map_failure_message.dart';

part 'connection_request_event.dart';
part 'connection_request_state.dart';

class ConnectionRequestBloc extends Bloc<ConnectionRequestEvent, ConnectionRequestState> {

  final GetConnectionRequestReceived getConnectionRequestReceived;

  ConnectionRequestBloc({required this.getConnectionRequestReceived}) : super(EmptyState()) {
    on<GetConnectionRequestReceivedEvent>(_getConnectionRequestList);
  }
  Future<void> _getConnectionRequestList(GetConnectionRequestReceivedEvent event, Emitter emit)async{
      emit(Loading());
      final response = await getConnectionRequestReceived(GetRequestParams(limit: event.limit, page: event.page));
      response.fold((failure){
        emit(ErrorState(message: mapFailureToMessage(failure)));
      }, (connections){
        emit(connections);
      });
  }
}
