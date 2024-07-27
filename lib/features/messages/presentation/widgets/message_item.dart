import 'package:flutter/material.dart';
import 'package:scholariship/core/utils/date_format_utils.dart';
import 'package:scholariship/features/messages/models/messages.dart';


class MessageItem extends StatelessWidget {
  final Message message;
  final String userId;

  const MessageItem({super.key, required this.message, required this.userId});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: message.senderId == userId
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            formatDate(message.sentAt),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Column(
          mainAxisAlignment: message.senderId == userId
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment:  message.senderId == userId ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (message.senderId != userId)
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://ui-avatars.com/api/?name=${message.sender.username}'),
              ),
            if (message.url != null)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  message.url!,
                  width: width * 0.5, // Adjust size as needed
                  height: width * 0.5, // Adjust size as needed
                  fit: BoxFit.cover,
                ),
              ),
            Container(
              constraints: BoxConstraints(
                maxWidth: width * 0.5,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: message.content.isNotEmpty ? message.senderId == userId
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary: null,
                borderRadius: BorderRadius.circular(12),
              ),
              child: message.content.isNotEmpty ? Text(
                message.content,
                style: message.senderId == userId
                    ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                )
                    : Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ): const SizedBox.shrink(),
            ),
          ],
        ),
      ],
    );
  }
}
