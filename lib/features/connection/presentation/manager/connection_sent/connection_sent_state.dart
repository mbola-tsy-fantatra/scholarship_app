part of 'connection_sent_bloc.dart';

abstract class ConnectionSentState extends Equatable {
  const ConnectionSentState();
}

class EmptyState extends ConnectionSentState {
  @override
  List<Object> get props => [];
}

class Loading extends ConnectionSentState{
  @override
  List<Object> get props => [];
}

class Loaded extends ConnectionSentState{
  final List<ConnectionSender> connection;

  const Loaded({required this.connection});

  @override
  List<Object> get props => [connection];
}


class ErrorState extends ConnectionSentState {
  final String message;
  const ErrorState({required this.message});
  @override
  List<Object?> get props => [];
}