import 'package:dartz/dartz.dart';
import 'package:scholariship/core/dto/profile/create_profile_dto.dart';
import 'package:scholariship/features/profile/domain/entities/user.dart';
import 'package:scholariship/global/error/failure.dart';


abstract class ProfileRepository{
  Future<Either<Failure,User>>? getUserProfileInfo(String userId);
  Future<Either<Failure,User>>? createUserProfileInfo(CreateProfileDto users);
  Future<Either<Failure,User>>? updateUserProfileInfo(CreateProfileDto users);
}