import 'package:dartz/dartz.dart';
import 'package:scholariship/features/notifications/domain/entities/Notification.dart';

import 'package:scholariship/global/error/failure.dart';

abstract class NotificationRepository{
  Future<Either<Failure,List<Notifications>>> getNotifications();
}