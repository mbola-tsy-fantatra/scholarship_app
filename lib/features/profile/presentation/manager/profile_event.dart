part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetUserProfileEvent extends ProfileEvent{
  final String userId;

  const GetUserProfileEvent({required this.userId});
  @override
  List<Object?> get props => [userId];

}
class CreateUserProfileEvent extends ProfileEvent {
  final CreateProfileDto profileDto;

  const CreateUserProfileEvent({required this.profileDto});

  @override
  List<Object> get props => [profileDto];
}

class UpdateUserProfileEvent extends ProfileEvent {
  final CreateProfileDto profileDto;

  const UpdateUserProfileEvent({required this.profileDto});

  @override
  List<Object> get props => [profileDto];
}
