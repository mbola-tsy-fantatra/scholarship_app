import 'package:equatable/equatable.dart';
import '../../domain/entities/from.dart';
import 'notification_profile_model.dart';

class FromModel extends From {
  const FromModel({
    required String id,
    required NotificationProfileModel profile,
  }) : super(
    id: id,
    profile: profile,
  );

  factory FromModel.fromJson(Map<String, dynamic> json) {
    return FromModel(
      id: json['id'],
      profile: NotificationProfileModel.fromJson(json['profile']),
    );
  }


}
