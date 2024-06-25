import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/connection/data/request/connection_request.dart';
import 'package:scholariship/features/connection/domain/entities/connection_sender.dart';
import 'package:scholariship/features/connection/domain/repository/connection_repository.dart';
import 'package:scholariship/global/error/failure.dart';

class SendConnectionRequest extends UseCase<ConnectionSender,Params>{

  final ConnectionRepository connectionRepository;

  SendConnectionRequest({required this.connectionRepository});

  @override
  Future<Either<Failure, ConnectionSender?>?> call(Params params) async{
    return connectionRepository.sendConnectionRequest(params.connectionRequest);
  }

}
class Params extends Equatable{

  final ConnectionRequest connectionRequest;

  const Params({required this.connectionRequest});

  @override
  List<Object?> get props => [connectionRequest];

}