import 'package:scholariship/features/connection/data/models/sender_model.dart';

import '../../domain/entities/connection_received.dart';

class ConnectionReceivedModel extends ConnectionReceived {
  const ConnectionReceivedModel({
    required String senderId,
    required String receiverId,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    required SenderModel sender,
  }) : super(
    sender: sender,
    receiverId: receiverId,
    senderId: senderId,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory ConnectionReceivedModel.fromJson(Map<String, dynamic> json) {
    return ConnectionReceivedModel(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      sender: SenderModel.fromJson(json['sender']),
    );
  }
}