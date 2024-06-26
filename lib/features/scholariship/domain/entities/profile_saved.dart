import 'package:equatable/equatable.dart';

class ProfileSaved extends Equatable{

  final String userId;

  const ProfileSaved({required this.userId});

  @override
  List<Object?> get props => [userId];

}