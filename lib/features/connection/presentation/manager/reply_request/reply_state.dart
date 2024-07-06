part of 'reply_bloc.dart';

abstract class ReplyState extends Equatable {
  const ReplyState();
}

class Empty extends ReplyState {
  @override
  List<Object> get props => [];
}

class Loading extends ReplyState {
  @override
  List<Object> get props => [];
}

class Loaded extends ReplyState {
  @override
  List<Object> get props => [];
}


class ErrorState extends ReplyState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
