import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/connection/data/request/connection_reply.dart';
import 'package:scholariship/features/connection/domain/repository/connection_repository.dart';
import 'package:scholariship/global/error/failure.dart';

class RejectRequestUseCase extends UseCase<void,ReplyParams>{

  final ConnectionRepository connectionRepository;

  RejectRequestUseCase({required this.connectionRepository});

  @override
  Future<Either<Failure, void>?> call(ReplyParams params)async {
    return await connectionRepository.replyToRequest(params.connectionReply);
  }

}

class ReplyParams extends Equatable{

  final ConnectionReply connectionReply;
  const ReplyParams({required this.connectionReply});
  @override
  List<Object?> get props => [connectionReply];

}