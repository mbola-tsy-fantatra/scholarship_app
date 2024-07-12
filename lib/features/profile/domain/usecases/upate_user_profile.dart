import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/dto/profile/create_profile_dto.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../global/error/failure.dart';
import '../entities/profile.dart';
import '../repository/profile_repository.dart';

class UpdateUserProfile implements UseCase<ProfileUser,UpdateParams>{

  final ProfileRepository profileRepository;
  const UpdateUserProfile({required this.profileRepository});

  @override
  Future<Either<Failure, ProfileUser>?> call(UpdateParams params) async{
    return await  profileRepository.updateUserProfileInfo(params.profileDto);
  }

}
class UpdateParams extends Equatable{

  final CreateProfileDto profileDto;

  const UpdateParams({required this.profileDto});

  @override
  List<Object?> get props => [profileDto];

}