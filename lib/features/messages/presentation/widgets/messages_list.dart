import 'package:flutter/material.dart';
import 'package:scholariship/features/messages/models/messages.dart';
import 'package:scholariship/features/messages/presentation/widgets/message_item.dart';


class MessageList extends StatelessWidget {
  final List<Message?> messages;
  final String userId;
  final ScrollController scrollController;
  const MessageList({Key? key, required this.messages, required this.userId, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return ListView.builder(
      controller: scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages.reversed.toList()[index];
        return MessageItem(userId: userId , message: message!,);
      },
    );
  }
}