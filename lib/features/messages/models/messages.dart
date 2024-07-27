import 'package:scholariship/features/messages/models/user.dart';

enum MediaType {
  IMAGE
}
class Message {
  final String id;
  final String content;
  final String senderId;
  final String receiverId;
  final DateTime sentAt;
  final String conversationId;
  final String? url;
  final String? mediaType;
  final int?  mediaSize;

  final User sender;

  const Message({
    required this.id,
    required this.content,
    required this.senderId,
    required this.receiverId,
    required this.sentAt,
    required this.conversationId,
    required this.sender,
    this.mediaType,
    this.mediaSize,
    this.url
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      content: json['content'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      sentAt: DateTime.parse(json['sentAt']),
      conversationId: json['conversationId'],
      sender: User.fromJson(json['sender']),
      url: json['url'],
      mediaSize: json['mediaSize'],
      mediaType: json['mediaType']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'receiverId': receiverId,
      'conversationId': conversationId,
    };
  }
}



  