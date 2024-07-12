import 'package:dartz/dartz.dart';
import 'package:scholariship/features/connection/data/request/connection_reply.dart';
import 'package:scholariship/features/connection/data/request/connection_request.dart';
import 'package:scholariship/features/connection/domain/entities/connection.dart';
import 'package:scholariship/features/connection/domain/entities/connection_received.dart';
import 'package:scholariship/features/connection/domain/entities/user_profile.dart';
import '../../../../global/error/failure.dart';
import '../entities/connection_sender.dart';

abstract class ConnectionRepository{
  Future<Either<Failure,Connection>> getConnectionRequest(int limit,int page);
  Future<Either<Failure,List<ConnectionReceived>>> getConnectionRequestReceiver(int limit,int page);
  Future<Either<Failure,List<ConnectionSender>>> getConnectionRequestSent(int limit,int page);
  Future<Either<Failure,ConnectionSender>> sendConnectionRequest(ConnectionRequest connectionRequest);
  Future<Either<Failure,List<UserProfile>>> getConnectionProfile();
  Future<Either<Failure,void>> replyToRequest(ConnectionReply connectionReply);
}