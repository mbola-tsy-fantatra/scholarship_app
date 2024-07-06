import 'package:dartz/dartz.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/connection/domain/usecases/reject_request_use_case.dart';
import 'package:scholariship/global/error/failure.dart';

import '../repository/connection_repository.dart';


class AcceptRequestUseCase extends UseCase<void,ReplyParams>{
  final ConnectionRepository connectionRepository;

  AcceptRequestUseCase({required this.connectionRepository});

  @override
  Future<Either<Failure, void>?> call(ReplyParams params) async{
    return await connectionRepository.replyToRequest(params.connectionReply);
  }
}
