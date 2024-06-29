
import 'package:flutter/material.dart';
import 'package:scholariship/features/messages/models/messages.dart';
import 'package:scholariship/features/messages/presentation/widgets/message_item.dart';


class MessageList extends StatefulWidget {
  final List<Message?> messages;
  final String userId;
  final ScrollController scrollController;
  const MessageList({Key? key, required this.messages, required this.userId, required this.scrollController}) : super(key: key);

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  void initState() {
    // TODO: implement initState
    widget.scrollController.animateTo(
        widget.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      controller: widget.scrollController,
      itemCount: widget.messages.length,
      itemBuilder: (context, index) {
        final message = widget.messages.reversed.toList()[index];
        return MessageItem(userId: widget.userId , message: message!,);
      },
    );
  }
}