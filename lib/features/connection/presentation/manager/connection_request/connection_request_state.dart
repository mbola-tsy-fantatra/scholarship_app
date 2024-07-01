part of 'connection_request_bloc.dart';

abstract class ConnectionRequestState extends Equatable {
  const ConnectionRequestState();
}

class EmptyState extends ConnectionRequestState {
  @override
  List<Object> get props => [];
}

class Loading extends ConnectionRequestState{
  @override
  List<Object> get props => [];
}

class Loaded extends ConnectionRequestState{
  final List<ConnectionReceived> connection;

  const Loaded({required this.connection});

  @override
  List<Object> get props => [connection];
}


class ErrorState extends ConnectionRequestState {
  final String message;
  const ErrorState({required this.message});
  @override
  List<Object?> get props => [];
}