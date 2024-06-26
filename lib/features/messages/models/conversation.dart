import 'package:equatable/equatable.dart';
import 'package:scholariship/features/messages/models/messages.dart';

import 'user.dart';


class Conversation extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Message lastMessages;
  final Participant participants;

  const Conversation({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.lastMessages,
    required this.participants,
  });
 
factory Conversation.fromJson(Map<String, dynamic> json) {
  return Conversation(
    id: json['id'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    lastMessages: Message.fromJson(json['messages'] as Map<String, dynamic>),
    participants: Participant.fromJson(json['participants'] as Map<String, dynamic>),
  );
}
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'messages': lastMessages,
      'participants': participants,
    };
  }
  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        lastMessages,
      ];
}


class Participant extends Equatable {
  final User participantA;
  final User participantB;

  const Participant({
    required this.participantA,
    required this.participantB,
  });
  factory Participant.fromJson(Map<String, dynamic> json){
     return Participant(
      participantA: User.fromJson(json['participantA'] as Map<String, dynamic>), 
      participantB: User.fromJson(json['participantB'] as Map<String, dynamic>)
      ); 
  }

  @override
  // TODO: implement props
  List<Object?> get props => [participantA, participantB];

}