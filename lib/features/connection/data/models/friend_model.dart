import 'package:scholariship/features/connection/data/models/profile_model.dart';

import '../../domain/entities/friend.dart';

class FriendModel extends Friend {
  const FriendModel({
    required String username,
    required ProfileModel profile,
  }) : super(
    username: username,
    profile: profile,
  );

  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
      username: json['username'],
      profile: ProfileModel.fromJson(json['profile']),
    );
  }
}