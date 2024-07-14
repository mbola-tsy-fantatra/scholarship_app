part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class Empty extends ProfileState {
  @override
  List<Object> get props => [];
}

class Loading extends ProfileState {
  @override
  List<Object> get props => [];
}

class Loaded extends ProfileState{
  final ProfileUser user;
  const Loaded({required this.user});
  @override
  List<Object> get props => [user];
}

class ErrorState extends ProfileState {
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
