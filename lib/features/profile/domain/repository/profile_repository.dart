import 'package:dartz/dartz.dart';
import 'package:scholariship/core/dto/profile/create_profile_dto.dart';
import 'package:scholariship/global/error/failure.dart';
import '../entities/profile.dart';


abstract class ProfileRepository{
  Future<Either<Failure,ProfileUser>>? getUserProfileInfo(String userId);
  Future<Either<Failure,ProfileUser>>? createUserProfileInfo(CreateProfileDto users);
  Future<Either<Failure,ProfileUser>>? updateUserProfileInfo(CreateProfileDto users);
}