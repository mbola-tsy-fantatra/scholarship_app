
import 'package:equatable/equatable.dart';

import 'user.dart';

class Message extends Equatable{
  final String id;
  final String senderId;
  final String recieverId;
  final String conversationId;
  final String content;
  final DateTime sentAt;
  final User sender;
  
  const Message({
    required this.id, 
    required this.senderId, 
    required this.content, 
    required this.recieverId, 
    required this.sentAt,
    required this.conversationId,
    required this.sender
    });

  factory Message.fromJson(Map<String, dynamic> json)  {
    return Message(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      recieverId: json['recieverId'] as String,
      conversationId: json['conversationId'] as String,
      content: json['content'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
      sender: User.fromJson(json['sender'] as Map<String, dynamic>)
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'recieverId': recieverId,
      'conversationId': conversationId,
      'content': content,
    };
  }
  @override
  // TODO: implement props
  List<Object?> get props => [id,recieverId, senderId, conversationId, content, sentAt];
  
}


  