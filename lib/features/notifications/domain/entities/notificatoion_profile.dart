import 'package:equatable/equatable.dart';

class NotificationProfile extends Equatable{
  final String id;
  final String profilePicture;
  final String username;

  const NotificationProfile({required this.username,required this.profilePicture,required this.id});

  @override
  List<Object?> get props => [id, profilePicture, username];
}