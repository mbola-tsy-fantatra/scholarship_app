part of 'send_request_bloc.dart';

abstract class SendRequestEvent extends Equatable {
  const SendRequestEvent();
}

class SendRequest extends SendRequestEvent{
  final ConnectionRequest connectionRequest;

  const SendRequest({required this.connectionRequest});
  @override
  List<Object?> get props => [connectionRequest];
}
