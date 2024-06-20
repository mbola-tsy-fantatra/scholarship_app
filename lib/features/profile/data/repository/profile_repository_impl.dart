import 'package:dartz/dartz.dart';
import 'package:scholariship/features/profile/data/datasources/user_remote_data_source.dart';
import 'package:scholariship/features/profile/domain/repository/profile_repository.dart';
import 'package:scholariship/global/error/exeception.dart';
import 'package:scholariship/global/error/failure.dart';

import '../models/user_model.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  final UserRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserModel>>? getUserProfileInfo() async{
    try{
        final response = await remoteDataSource.getUserProfileInfo();
        return Right(response!);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}