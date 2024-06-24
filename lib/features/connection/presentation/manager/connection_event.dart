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

class GetConnectionRequestSent extends ConnectionEvent{
  final int limit;
  final int page;

  const GetConnectionRequestSent({required this.page,required this.limit});

  @override
  List<Object?> get props => [limit,page];
}
class GetConnectionRequestReceived extends ConnectionEvent{
  final int limit;
  final int page;

  const GetConnectionRequestReceived({required this.page,required this.limit});

  @override
  List<Object?> get props => [limit,page];
}