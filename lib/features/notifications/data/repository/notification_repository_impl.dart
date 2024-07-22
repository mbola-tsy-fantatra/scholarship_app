import 'package:dartz/dartz.dart';
import 'package:scholariship/features/notifications/data/datasources/notification_remote_data_source.dart';
import 'package:scholariship/global/error/exeception.dart';
import 'package:scholariship/global/error/failure.dart';
import '../../domain/entities/Notification.dart';
import '../../domain/repository/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository{

  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Notifications>>> getNotifications() async{
    try{
      final notifications = await remoteDataSource.getNotificationsList();
      return Right(notifications);
    }on ServerException{
      return Left(ServerFailure());
    }
  }





}