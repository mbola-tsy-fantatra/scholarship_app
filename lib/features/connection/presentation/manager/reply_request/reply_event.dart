part of 'reply_bloc.dart';

abstract class ReplyEvent extends Equatable {
  const ReplyEvent();
}

class AcceptRequest extends ReplyEvent{
  final String receiverId;

  const AcceptRequest({required this.receiverId });

  @override
  List<Object?> get props => [receiverId];
}

class RejectRequest extends ReplyEvent{

  final String receiverId;

  const RejectRequest({required this.receiverId });

  @override
  List<Object?> get props => [receiverId];

}
