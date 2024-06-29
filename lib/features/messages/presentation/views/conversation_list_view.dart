
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scholariship/features/messages/models/conversation.dart';
import 'package:scholariship/features/messages/presentation/widgets/conversation_item.dart';
import 'package:provider/provider.dart';
import 'package:scholariship/features/messages/repositories/conversation_repository.dart';
import 'package:scholariship/core/config/injection_container.dart' as di;
@RoutePage()
class ConversationListScreen extends StatelessWidget {
  const ConversationListScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ConversationRepository>(
          create: (_) => di.sl<ConversationRepository>(),
        ),
      ],
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Column(
            children: [
              SearchInput(),
              SizedBox(height: 16.0),
              Expanded(
                child: ConversationListContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//conversation list container 

class ConversationListContainer extends StatefulWidget {
  const ConversationListContainer({super.key});

  @override
  State<ConversationListContainer> createState() => _ConversationListContainerState();
}

class _ConversationListContainerState extends State<ConversationListContainer> {
  late ConversationRepository conversationRepository;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    conversationRepository = Provider.of<ConversationRepository>(context, listen: false);
    conversationRepository.sendMessage('chat:conversation:list', {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<List<Conversation>>(
      stream: conversationRepository.conversationStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No conversations available'));
        } else {
          final conversations = snapshot.data!;
          return ListView.builder(
            itemCount: conversations.length,
            itemBuilder: (context, index) {
              return ConversationItem(conversation: conversations[index]);
            },
          );
        }
      },
    );
  }
}


// search input
class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
                 color: Colors.grey[200],
                 borderRadius: BorderRadius.circular(25.0),
              ),
              
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search your chat",
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search_outlined),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0)
          ),
      ),
    );
  }
}



