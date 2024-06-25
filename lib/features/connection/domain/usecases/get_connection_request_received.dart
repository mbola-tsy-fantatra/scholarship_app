import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/connection/domain/entities/connection_received.dart';
import 'package:scholariship/features/connection/domain/repository/connection_repository.dart';
import 'package:scholariship/global/error/failure.dart';


class GetConnectionRequestReceived extends UseCase<List<ConnectionReceived>,GetRequestParams>{

  final ConnectionRepository connectionRepository;

  GetConnectionRequestReceived({required this.connectionRepository});

  @override
  Future<Either<Failure, List<ConnectionReceived>>> call(GetRequestParams params) async{
    return await connectionRepository.getConnectionRequestReceiver(params.limit, params.page);
  }

}

class GetRequestParams extends Equatable{
  final int limit;
  final int page;

  const  GetRequestParams({required this.limit, required this.page});

  @override
  List<Object?> get props => [limit,page];

}