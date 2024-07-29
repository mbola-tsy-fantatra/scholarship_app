import 'package:equatable/equatable.dart';

class Profile extends Equatable{

  final String id;
  final String? profilePicture;

  const Profile({required this.id,  this.profilePicture});

  @override
  List<Object?> get props => [id,profilePicture];

}