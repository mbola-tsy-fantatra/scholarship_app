import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/global/error/failure.dart';

import '../entities/connection.dart';
import '../repository/connection_repository.dart';

class GetConnectionRequestSent extends UseCase<Connection,GetConnectionParams>{

  final ConnectionRepository connectionRepository;

  GetConnectionRequestSent({required this.connectionRepository});

  @override
  Future<Either<Failure, Connection>> call(GetConnectionParams params) async{
    return await connectionRepository.getConnectionRequest(params.limit, params.page);
  }

}

class GetConnectionParams extends Equatable{
  final int limit;
  final int page;

  const  GetConnectionParams({required this.limit, required this.page});

  @override
  List<Object?> get props => [limit,page];

}