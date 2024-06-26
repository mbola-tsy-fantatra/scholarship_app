import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String profilePicture;

  const User({
    required this.id,
    required this.username,
    required this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      username: json['username'] as String,
      profilePicture: json['profilePicture'] as String,
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, username, profilePicture];
}