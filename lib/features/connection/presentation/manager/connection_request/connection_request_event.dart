part of 'connection_request_bloc.dart';

abstract class ConnectionRequestEvent extends Equatable {
  const ConnectionRequestEvent();
}

class GetConnectionRequestReceivedEvent extends ConnectionRequestEvent{
  final int limit;
  final int page;

  const GetConnectionRequestReceivedEvent({required this.page,required this.limit});

  @override
  List<Object?> get props => [limit,page];
}
