import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/global/error/failure.dart';

import '../entities/connection.dart';

class GetConnectionRequestSent extends UseCase<Connection,GetConnectionParams>{
  @override
  Future<Either<Failure, Connection>> call(GetConnectionParams params) {

    throw UnimplementedError();
  }

}

class GetConnectionParams extends Equatable{
  final int limit;
  final int page;

  const  GetConnectionParams({required this.limit, required this.page});

  @override
  List<Object?> get props => [limit,page];

}