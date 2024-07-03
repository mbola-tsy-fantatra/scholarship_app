part of 'send_request_bloc.dart';

abstract class SendRequestState extends Equatable {
  const SendRequestState();
}

class Empty extends SendRequestState {
  @override
  List<Object> get props => [];
}

class RequestSending extends SendRequestState {
  @override
  List<Object?> get props => [];
}

class RequestSent extends SendRequestState {
  @override
  List<Object?> get props => [];
}


class SendErrorState extends SendRequestState {
  final String message;

  const SendErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}