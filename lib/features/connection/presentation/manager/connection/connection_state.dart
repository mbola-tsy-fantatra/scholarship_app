part of 'connection_bloc.dart';

abstract class ConnectionsState extends Equatable {
  const ConnectionsState();
}

class EmptyState extends ConnectionsState {
  @override
  List<Object> get props => [];
}

class Loading extends ConnectionsState{
  @override
  List<Object> get props => [];
}

class Loaded extends ConnectionsState{
  final Connection connection;

  const Loaded({required this.connection});

  @override
  List<Object> get props => [connection];
}
class ErrorState extends ConnectionsState {
  final String message;
  const ErrorState({required this.message});
  @override
  List<Object?> get props => [];
}