import '../../domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required String id,
    String? profilePicture,
  }) : super(
    id: id,
    profilePicture: profilePicture,
  );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      profilePicture: json['profilePicture'],
    );
  }
}