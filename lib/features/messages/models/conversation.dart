import 'package:equatable/equatable.dart';
import 'package:scholariship/features/messages/models/messages.dart';

import 'user.dart';


class Conversation extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Message?> messages;
  final Participant participants;

  const Conversation({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.messages,
    required this.participants,
  });
 
factory Conversation.fromJson(Map<String, dynamic> json) {
  return Conversation(
    id: json['id'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    messages: (json['messages'] as List)
          .map((e) => e == null ? null : Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    participants: Participant.fromJson(json['participants'] as Map<String, dynamic>),
  );
}
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'messages':  messages,
      'participants': participants,
    };
  }
  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        messages,
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