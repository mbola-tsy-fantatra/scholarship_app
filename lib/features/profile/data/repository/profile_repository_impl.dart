import 'package:dartz/dartz.dart';
import 'package:scholariship/core/dto/profile/create_profile_dto.dart';
import 'package:scholariship/features/profile/data/datasources/user_remote_data_source.dart';
import 'package:scholariship/features/profile/domain/repository/profile_repository.dart';
import 'package:scholariship/global/error/exeception.dart';
import 'package:scholariship/global/error/failure.dart';

import '../../domain/entities/user.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  final UserRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>>? getUserProfileInfo(String userId) async{
    try{
        final response = await remoteDataSource.getUserProfileInfo(userId);
        return Right(response);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>>? createUserProfileInfo(CreateProfileDto users) {
    // TODO: implement createUserProfileInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>>? updateUserProfileInfo(CreateProfileDto users) {
    // TODO: implement updateUserProfileInfo
    throw UnimplementedError();
  }

}