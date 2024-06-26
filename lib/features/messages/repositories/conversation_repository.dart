import 'dart:async';

import 'package:scholariship/core/services/websocket_manager.dart';
import 'package:scholariship/features/messages/models/conversation.dart';

class ConversationRepository {
  final SocketManager socketManager;
  final StreamController<List<Conversation>> _conversationStreamController = StreamController<List<Conversation>>();
  final List<Conversation> _conversations = [];

  List<Conversation> get conversations => _conversations;

  ConversationRepository({required this.socketManager}){
     socketManager.onEvent('chat:conversation:loaded', (data) {
        var conversationsFromJson = data as List;
        for (var convJson in conversationsFromJson) {
            Conversation conversation = Conversation.fromJson(convJson);
            _conversations.add(conversation);
        }
        _conversationStreamController.add(_conversations);
     });
  }
  Stream<List<Conversation>> get conversationStream => _conversationStreamController.stream;
}
