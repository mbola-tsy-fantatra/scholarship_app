import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/global/utils/map_failure_message.dart';

import '../../../domain/entities/connection.dart';
import '../../../domain/usecases/get_connection_request.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final GetConnectionRequest getConnectionRequest;
  ConnectionBloc({required this.getConnectionRequest}) : super(EmptyState()) {
    on<GetConnections>(_getConnectionList);
  }

  Future<void> _getConnectionList(GetConnections event, Emitter emit)async{
      emit(Loading());
      final response = await getConnectionRequest(Params(limit: event.limit, page: event.page));
      response?.fold((failure){
          emit(ErrorState(message: mapFailureToMessage(failure)));
      }, (connections){
        emit(connections);
      });
  }

}
