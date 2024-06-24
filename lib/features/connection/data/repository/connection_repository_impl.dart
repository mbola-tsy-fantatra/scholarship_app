import 'package:dartz/dartz.dart';
import 'package:scholariship/features/connection/domain/entities/connection.dart';
import 'package:scholariship/features/connection/domain/entities/connection_received.dart';
import 'package:scholariship/features/connection/domain/entities/connection_sender.dart';
import 'package:scholariship/features/connection/domain/repository/connection_repository.dart';
import 'package:scholariship/global/error/failure.dart';

class ConnectionRepositoryImpl implements ConnectionRepository{



  @override
  Future<Either<Failure, Connection>> getConnectionRequest(int limit, int page) {
    // TODO: implement getConnectionRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ConnectionReceived>> getConnectionRequestReceiver(int limit, int page) {
    // TODO: implement getConnectionRequestReceiver
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ConnectionSender>> getConnectionRequestSent(int limit, int page) {
    // TODO: implement getConnectionRequestSent
    throw UnimplementedError();
  }


}