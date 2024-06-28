import 'package:equatable/equatable.dart';


class User extends Equatable {
  final String id;
  final String username;
  final Profile profile;

  const User({
    required this.id,
    required this.username,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      profile: Profile.fromJson(json['profile']),
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, username, profile];
}


class Profile  extends Equatable{
  final String id;
  final String? profilePicture;

  const Profile({
    required this.id,
    this.profilePicture,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      profilePicture: json['profilePicture'],
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, profilePicture];
}
