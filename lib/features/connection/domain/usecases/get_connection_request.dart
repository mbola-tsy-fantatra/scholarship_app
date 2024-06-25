import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/connection/domain/repository/connection_repository.dart';
import 'package:scholariship/global/error/failure.dart';

import '../entities/connection.dart';

class GetConnectionRequest extends UseCase<Connection,Params>{

  final ConnectionRepository connectionRepository;

  GetConnectionRequest({required this.connectionRepository});

  @override
  Future<Either<Failure, Connection?>?> call(Params params) async{
    return await connectionRepository.getConnectionRequest(params.limit, params.page);
  }

}

class Params extends Equatable{
  final int limit;
  final int page;

  const  Params({required this.limit, required this.page});

  @override
  List<Object?> get props => [limit,page];

}