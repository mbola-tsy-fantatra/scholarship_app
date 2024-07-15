part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class Empty extends NotificationState {
  @override
  List<Object?> get props => [];
}

class Loading extends NotificationState {
  @override
  List<Object?> get props => [];
}

class Loaded extends NotificationState {
  final List<Notifications>? notifications;

  const Loaded({required this.notifications});

  @override
  List<Object?> get props => [notifications];
}

class ErrorState extends NotificationState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
