import 'package:equatable/equatable.dart';
import 'package:scholariship/features/connection/domain/entities/friend.dart';

class ConnectionItem extends Equatable{
  final String userId;
  final String friendId;
  final Friend friend;

  const ConnectionItem({required this.friend,required this.userId,required this.friendId});

  @override
  List<Object?> get props => [userId, friendId, friend];

}