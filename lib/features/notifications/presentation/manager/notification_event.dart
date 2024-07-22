part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class GetNotificationEvent extends NotificationEvent {
  @override
  List<Object?> get props => [];
}

class NewNotificationEvent extends NotificationEvent {
  final Notifications notification;

  const NewNotificationEvent(this.notification);

  @override
  List<Object?> get props => [notification];
}