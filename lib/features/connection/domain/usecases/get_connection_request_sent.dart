import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/global/error/failure.dart';

import '../entities/connection.dart';
import '../entities/connection_sender.dart';
import '../repository/connection_repository.dart';

class GetConnectionRequestSent extends UseCase<List<ConnectionSender>,GetConnectionParams>{

  final ConnectionRepository connectionRepository;

  GetConnectionRequestSent({required this.connectionRepository});

  @override
  Future<Either<Failure, List<ConnectionSender>>> call(GetConnectionParams params) async{
    return await connectionRepository.getConnectionRequestSent(params.page,params.limit);
  }

}

class GetConnectionParams extends Equatable{
  final int limit;
  final int page;

  const  GetConnectionParams({required this.limit, required this.page});

  @override
  List<Object?> get props => [limit,page];

}