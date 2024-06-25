part of 'connection_sent_bloc.dart';

abstract class ConnectionSentEvent extends Equatable {
  const ConnectionSentEvent();
}

class GetConnectionRequestSentEvent extends ConnectionSentEvent{
  final int limit;
  final int page;

  const GetConnectionRequestSentEvent({required this.page,required this.limit});

  @override
  List<Object?> get props => [limit,page];
}
