
import 'package:scholariship/features/connection/data/models/profile_model.dart';

import '../../domain/entities/profile.dart';
import '../../domain/entities/sender.dart';

class SenderModel extends Sender {
  const SenderModel({
    required String username,
    Profile? profile,
  }) : super(
    username: username,
    profile: profile,
  );

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      username: json['username'],
      profile: json['profile'] != null ? ProfileModel.fromJson(json['profile']) : null,
    );
  }
}