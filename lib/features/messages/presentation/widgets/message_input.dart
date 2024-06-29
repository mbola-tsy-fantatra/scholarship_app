import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholariship/features/messages/repositories/message_repositiory.dart';

class MessageInput extends StatelessWidget {
  final void Function() scrollToBottom;
  const MessageInput({Key? key, required this.scrollToBottom}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                hintText: 'Enter a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                )
              ),
            ),
          ),
          IconButton(
            icon: const  Icon(Icons.send),
            onPressed: () {
              final messageRepository = Provider.of<MessageRepositiory>(context, listen: false);
              final participants = messageRepository.conversation.participants;
              messageRepository.sendMessage('chat:message:send', 
              {
                'conversationId': messageRepository.conversation.id,
                'content': messageController.text,
                'receiverId': messageRepository.userId == participants.participantA.id ? participants.participantB.id : participants.participantA.id,
              }
              );
              scrollToBottom();
              messageController.clear();
            },
          ),
        ],
      ),
    );
  }
}
