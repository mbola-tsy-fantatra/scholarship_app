import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/profile/domain/entities/user.dart';
import 'package:scholariship/features/profile/domain/repository/profile_repository.dart';
import 'package:scholariship/global/error/failure.dart';

class GetUserProfile implements UseCase<User,Params>{

  final ProfileRepository profileRepository;

  const GetUserProfile({required this.profileRepository});

  @override
  Future<Either<Failure, User>?> call(Params params) async{
    return await profileRepository.getUserProfileInfo(params.userId);
  }

}
class Params extends Equatable{

  final String userId;

  const Params({required this.userId});

  @override
  List<Object?> get props => [userId];

}
