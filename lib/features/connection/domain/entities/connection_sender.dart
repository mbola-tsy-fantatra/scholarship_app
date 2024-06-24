import 'package:equatable/equatable.dart';
import 'package:scholariship/features/connection/domain/entities/sender.dart';

class ConnectionSender extends Equatable {

  final String senderId;
  final String receiverId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Sender receiver;


  const ConnectionSender({required this.receiver,required this.receiverId,required this.senderId,required this.status,required this.createdAt,required this.updatedAt});

  @override
  List<Object?> get props => [senderId,receiver,receiverId,status,createdAt,updatedAt];

}
