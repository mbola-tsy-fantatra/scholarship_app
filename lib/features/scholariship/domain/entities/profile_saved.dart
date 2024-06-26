import 'package:equatable/equatable.dart';

class ProfileSaved extends Equatable{

  final String username;
  final String userId;

  const ProfileSaved({required this.userId,required this.username});

  @override
  List<Object?> get props => [username,userId];

}