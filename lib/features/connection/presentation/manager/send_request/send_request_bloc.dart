
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../global/utils/map_failure_message.dart';
import '../../../data/request/connection_request.dart';
import '../../../domain/usecases/send_connection_request.dart';

part 'sned_request_event.dart';
part 'send_request_state.dart';

class SendRequestBloc extends Bloc<SendRequestEvent, SendRequestState> {
  final SendConnectionRequest sendConnectionRequest;

  SendRequestBloc({required this.sendConnectionRequest}) : super(Empty()) {
    on<SendRequest>(_sendRequest);
  }

  void _sendRequest(SendRequest event, Emitter<SendRequestState> emit) async {
    emit(RequestSending());
    final response = await sendConnectionRequest(Params(connectionRequest: event.connectionRequest));
    response?.fold((failure){
      emit(SendErrorState(message: mapFailureToMessage(failure)));
    }, (response){
      emit(RequestSent());
    });
  }
}
