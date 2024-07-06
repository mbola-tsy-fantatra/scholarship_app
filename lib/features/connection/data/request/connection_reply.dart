import 'package:equatable/equatable.dart';

class ConnectionReply extends Equatable{
  final String action;
  final String senderId;

  const ConnectionReply({required this.action,required this.senderId});

  factory ConnectionReply.fromJson(Map<String,dynamic> json){
    return ConnectionReply(action: json['action'], senderId: json['receiverId']);
  }

  Map<String,dynamic> toJson(){
    return {
      'action':action,
      'senderId':senderId
    };
  }

  @override
  List<Object?> get props => [senderId,action];
}