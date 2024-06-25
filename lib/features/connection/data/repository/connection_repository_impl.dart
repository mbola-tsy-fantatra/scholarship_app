import 'package:dartz/dartz.dart';
import 'package:scholariship/features/connection/data/datasources/connection_remote_data_sources.dart';
import 'package:scholariship/features/connection/domain/entities/connection.dart';
import 'package:scholariship/features/connection/domain/entities/connection_received.dart';
import 'package:scholariship/features/connection/domain/entities/connection_sender.dart';
import 'package:scholariship/features/connection/domain/repository/connection_repository.dart';
import 'package:scholariship/global/error/failure.dart';

import '../../../../global/error/exeception.dart';

class ConnectionRepositoryImpl implements ConnectionRepository{

  final ConnectionRemoteDataSources remoteDataSources;

  const ConnectionRepositoryImpl({required this.remoteDataSources});



  @override
  Future<Either<Failure, Connection>> getConnectionRequest(int limit, int page) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ConnectionReceived>>> getConnectionRequestReceiver(int limit, int page)async {
    try{
      final connectionReceived = await remoteDataSources.getConnectionReceived(limit, page);
      return Right(connectionReceived);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ConnectionSender>>> getConnectionRequestSent(int limit, int page) {
    // TODO: implement getConnectionRequestSent
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ConnectionReceived>> sendConnectionRequest(ConnectionReceived connectionReceived) {
    // TODO: implement sendConnectionRequest
    throw UnimplementedError();
  }






}