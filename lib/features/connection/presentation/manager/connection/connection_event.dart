part of 'connection_bloc.dart';

abstract class ConnectionEvent extends Equatable {
  const ConnectionEvent();
}

class Empty extends ConnectionEvent{
  @override
  List<Object?> get props => [];
}
class CreateConnectionLoading extends ConnectionEvent{
  @override
  List<Object?> get props => [];
}

class CreateConnectionLoaded extends ConnectionEvent{
  @override
  List<Object?> get props => [];
}

class GetConnections extends ConnectionEvent{
  final int limit;
  final int page;

  const GetConnections({required this.limit,required this.page});

  @override
  List<Object?> get props => [limit,page];
}
