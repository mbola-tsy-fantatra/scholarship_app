import 'package:equatable/equatable.dart';
import 'package:scholariship/features/connection/domain/entities/sender.dart';

class ConnectionReceived extends Equatable {

  final String senderId;
  final String receiverId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Sender sender;


  const ConnectionReceived({required this.sender,required this.receiverId,required this.senderId,required this.status,required this.createdAt,required this.updatedAt});

  @override
  List<Object?> get props => [senderId,sender,receiverId,status,createdAt,updatedAt];

}
