import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/dto/profile/create_profile_dto.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/global/error/failure.dart';
import '../entities/profile.dart';
import '../repository/profile_repository.dart';

class CreateUserProfile implements UseCase<ProfileUser,CreateParams>{

  final ProfileRepository profileRepository;
  const CreateUserProfile({required this.profileRepository});

  @override
  Future<Either<Failure, ProfileUser>?> call(CreateParams params) async{
    return await  profileRepository.createUserProfileInfo(params.profileDto);
  }

}

class CreateParams extends Equatable{

  final CreateProfileDto profileDto;
  
  const CreateParams({required this.profileDto});

  @override
  List<Object?> get props => [profileDto];

}