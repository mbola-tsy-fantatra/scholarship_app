import 'package:equatable/equatable.dart';

class ConnectionReply extends Equatable{
  final String action;
  final String receiverId;

  const ConnectionReply({required this.action,required this.receiverId});

  factory ConnectionReply.fromJson(Map<String,dynamic> json){
    return ConnectionReply(action: json['action'], receiverId: json['receiverId']);
  }

  Map<String,dynamic> toJson(){
    return {
      'action':action,
      'receiverId':receiverId
    };
  }

  @override
  List<Object?> get props => [receiverId,action];
}