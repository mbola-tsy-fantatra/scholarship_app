import 'package:dartz/dartz.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/connection/domain/entities/user_profile.dart';
import 'package:scholariship/features/connection/domain/repository/connection_repository.dart';
import 'package:scholariship/global/error/failure.dart';

class GetConnectionSuggestion extends UseCase<List<UserProfile>,NoParams>{

  final ConnectionRepository repository;

   GetConnectionSuggestion({required this.repository});

  @override
  Future<Either<Failure, List<UserProfile>>> call(NoParams params) async{
     return  await repository.getConnectionProfile();
  }
}
