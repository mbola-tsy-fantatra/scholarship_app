import 'package:flutter/material.dart';
import 'package:scholariship/features/messages/models/user.dart';


class DiscussionHeader extends StatelessWidget {
  final User friendInfo;

  const DiscussionHeader({Key? key, required this.friendInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.deepOrange,
          backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=${friendInfo.username}'),
        ),
        const SizedBox(width: 8.0),
        Text(friendInfo.username, style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        )
        ),
      ],
    );
  }
}