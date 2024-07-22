import 'package:equatable/equatable.dart';

import '../../domain/entities/notificatoion_profile.dart';


class NotificationProfileModel extends NotificationProfile {
  const NotificationProfileModel({
    required String id,
    required String profilePicture,
    required String username,
  }) : super(
    id: id,
    profilePicture: profilePicture,
    username: username,
  );

  factory NotificationProfileModel.fromJson(Map<String, dynamic> json) {
    return NotificationProfileModel(
      id: json['id'],
      profilePicture: json['profilePicture'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profilePicture': profilePicture,
      'username': username,
    };
  }
}
