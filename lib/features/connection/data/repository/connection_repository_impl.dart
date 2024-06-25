import 'package:dartz/dartz.dart';
import 'package:scholariship/features/connection/data/datasources/connection_remote_data_sources.dart';
import 'package:scholariship/features/connection/domain/entities/connection.dart';
import 'package:scholariship/features/connection/domain/entities/connection_received.dart';
import 'package:scholariship/features/connection/domain/entities/connection_sender.dart';
import 'package:scholariship/features/connection/domain/repository/connection_repository.dart';
import 'package:scholariship/global/error/failure.dart';
import '../../../../global/error/exeception.dart';
import '../request/connection_request.dart';

class ConnectionRepositoryImpl implements ConnectionRepository{

  final ConnectionRemoteDataSources remoteDataSources;

  const ConnectionRepositoryImpl({required this.remoteDataSources});



  @override
  Future<Either<Failure, Connection>> getConnectionRequest(int limit, int page) async{
    try{
      final connections = await remoteDataSources.getConnections(limit, page);
      return Right(connections);
    }on ServerException{
      return Left(ServerFailure());
    }
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
  Future<Either<Failure, List<ConnectionSender>>> getConnectionRequestSent(int limit, int page) async{
    try{
      final connectionSent = await remoteDataSources.getConnectionSent(limit, page);
      return Right(connectionSent);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ConnectionSender>> sendConnectionRequest(ConnectionRequest connectionRequest) async{
    try{
      final connectionSent = await remoteDataSources.sendConnectionRequest(connectionRequest);
      return Right(connectionSent);
    }on ServerException{
      return Left(ServerFailure());
    }
  }






}