part of 'connection_bloc.dart';

abstract class ConnectionState extends Equatable {
  const ConnectionState();
}

class EmptyState extends ConnectionState {
  @override
  List<Object> get props => [];
}

class Loading extends ConnectionState{
  @override
  List<Object> get props => [];
}

class Loaded extends ConnectionState{
  final List<Connection> connection;

  const Loaded({required this.connection});

  @override
  List<Object> get props => [connection];
}
class ErrorState extends ConnectionState {
  final String message;
  const ErrorState({required this.message});
  @override
  List<Object?> get props => [];
}