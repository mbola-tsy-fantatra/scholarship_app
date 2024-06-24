import 'package:scholariship/features/connection/data/models/sender_model.dart';
import '../../domain/entities/connection_sender.dart';

class ConnectionSenderModel extends ConnectionSender {
  const ConnectionSenderModel({
    required String senderId,
    required String receiverId,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    required SenderModel receiver,
  }) : super(
    senderId: senderId,
    receiverId: receiverId,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
    receiver: receiver,
  );

  factory ConnectionSenderModel.fromJson(Map<String, dynamic> json) {
    return ConnectionSenderModel(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      receiver: SenderModel.fromJson(json['receiver']),
    );
  }
}