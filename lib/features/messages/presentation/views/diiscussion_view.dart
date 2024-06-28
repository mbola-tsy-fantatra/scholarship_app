import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholariship/features/messages/models/conversation.dart';
import 'package:scholariship/features/messages/presentation/widgets/conversation_header.dart';
import 'package:scholariship/features/messages/presentation/widgets/message_input.dart';
import 'package:scholariship/features/messages/presentation/widgets/messages_list.dart';
import 'package:scholariship/features/messages/repositories/message_repositiory.dart';
import 'package:scholariship/core/config/injection_container.dart' as di;





@RoutePage()
class DiscussionScreen extends StatelessWidget {
  final String conversationId;

  const DiscussionScreen({
    Key? key,
    @PathParam('conversationId') required this.conversationId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MessageRepositiory>(
          create: (_) => di.sl<MessageRepositiory>(),
        ),
      ],
      child: DiscussionContainer(conversationId: conversationId),
    );
  }
}

class DiscussionContainer extends StatefulWidget {
  final String conversationId;

  const DiscussionContainer({Key? key, required this.conversationId}) : super(key: key);

  @override
  State<DiscussionContainer> createState() => _DiscussionContainerState();
}

class _DiscussionContainerState extends State<DiscussionContainer> {
  late final MessageRepositiory messageRepository;
  final ScrollController _scrollController = ScrollController();
  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
  @override
  void initState() {
    super.initState();
     messageRepository = Provider.of<MessageRepositiory>(context, listen: false);
    messageRepository.sendMessage('chat:conversation:join', {'conversationId': widget.conversationId});
  }
  
  @override
  void dispose() {
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageRepository = Provider.of<MessageRepositiory>(context);
    return StreamBuilder<Conversation?>(
      stream: messageRepository.conversationStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final String userId = messageRepository.userId;
          final friendInfo = snapshot.data!.participants.participantA.id == userId ? snapshot.data!.participants.participantB : snapshot.data!.participants.participantA;
          return Scaffold(
            appBar: AppBar(
              title: DiscussionHeader(friendInfo: friendInfo),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: MessageList(messages: snapshot.data!.messages, userId: userId, scrollController: _scrollController)
                  ),
                  MessageInput(scrollToBottom: scrollToBottom),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}





