import 'package:dartz/dartz.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/notifications/domain/entities/Notification.dart';
import 'package:scholariship/features/notifications/domain/repository/notification_repository.dart';
import 'package:scholariship/global/error/failure.dart';

class GetNotificationUseCase extends UseCase<List<Notifications>,NoParams>{
  final NotificationRepository notificationRepository;
  GetNotificationUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, List<Notifications>?>?> call(NoParams params) async{
    return await notificationRepository.getNotifications();
  }

}