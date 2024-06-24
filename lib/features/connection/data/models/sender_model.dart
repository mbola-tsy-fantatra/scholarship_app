
import 'package:scholariship/features/connection/data/models/profile_model.dart';

import '../../domain/entities/profile.dart';
import '../../domain/entities/sender.dart';

class SenderModel extends Sender {
  const SenderModel({
    required String username,
    required Profile profile,
  }) : super(
    username: username,
    profile: profile,
  );

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      username: json['username'],
      profile: ProfileModel.fromJson(json['profile']),
    );
  }
}