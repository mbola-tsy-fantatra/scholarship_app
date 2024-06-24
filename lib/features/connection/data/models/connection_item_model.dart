import '../../domain/entities/connnection_item.dart';
import 'friend_model.dart';

class ConnectionItemModel extends ConnectionItem {
  const ConnectionItemModel({
    required String userId,
    required String friendId,
    required FriendModel friend,
  }) : super(
    userId: userId,
    friendId: friendId,
    friend: friend,
  );

  factory ConnectionItemModel.fromJson(Map<String, dynamic> json) {
    return ConnectionItemModel(
      userId: json['userId'],
      friendId: json['friendId'],
      friend: FriendModel.fromJson(json['friend']),
    );
  }
}