
import '../../domain/entities/Notification.dart';
import 'from_model.dart';

class NotificationModel extends Notifications {
  const NotificationModel({
    required String id,
    required String type,
    required String sourceId,
    required bool isRead,
    required String fromId,
    required String toId,
    required DateTime createdAt,
    required FromModel from,
    required String content
  }) : super(
    id: id,
    type: type,
    sourceId: sourceId,
    isRead: isRead,
    fromId: fromId,
    toId: toId,
    createdAt: createdAt,
    from: from,
    content: content
  );

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      type: json['type'],
      sourceId: json['sourceId'],
      isRead: json['isRead'],
      fromId: json['fromId'],
      toId: json['toId'],
      createdAt: DateTime.parse(json['createdAt']),
      from: FromModel.fromJson(json['from']),
      content: json['content'],
    );
  }
}