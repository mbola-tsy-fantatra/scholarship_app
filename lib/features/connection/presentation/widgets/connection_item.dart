import 'package:flutter/material.dart';

import '../../domain/entities/connnection_item.dart';
import 'connection_profile.dart';

class ConnectionItemWidget extends StatelessWidget {

  final ConnectionItem connectionItem;

  const ConnectionItemWidget({super.key,required this.connectionItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConnectionProfile(name: connectionItem.friend.username, userId: connectionItem.userId, mutualFriends: 5,),
            const InkWell(
              child: Icon(Icons.more_horiz_outlined),
            )
          ],
        )
    );
  }
}
