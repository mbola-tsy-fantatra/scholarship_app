import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholariship/core/utils/date_format_utils.dart';
import 'package:scholariship/core/utils/substract_string.dart';
import 'package:scholariship/features/messages/models/conversation.dart';
import 'package:scholariship/features/messages/models/user.dart';
import 'package:scholariship/features/messages/repositories/conversation_repository.dart';


class ConversationItem extends StatelessWidget {
  final Conversation conversation;
  const ConversationItem({super.key, required this.conversation});
  @override
  Widget build(BuildContext context) {
    final conversationRepo = Provider.of<ConversationRepository>(context, listen: false);
    String userId = conversationRepo.userId;
    User friendInfo = conversation.participants.participantA.id == userId ? conversation.participants.participantB : conversation.participants.participantA;
  
    //final String? profilePicture = conversation.participants.participantA.profile.profilePicture;
    final  isConversationMessageNotEmpty = conversation.messages.elementAtOrNull(0) != null;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
          backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=${friendInfo.username}'),
        ),
        title: Text(friendInfo.username, style: Theme.of(context).textTheme.titleMedium,),
        subtitle: Text(isConversationMessageNotEmpty ? substractString(0, 30, conversation.messages.first!.content) : 'Start new  conversation now ...' ),
        trailing: Text( isConversationMessageNotEmpty ? formatDate(conversation.messages[0]!.sentAt): ''),
        onTap: () {
          context.router.pushNamed('/discussions/${conversation.id}');
        },
      ),
    );
  }
}