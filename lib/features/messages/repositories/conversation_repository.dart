import 'dart:async';

import 'package:scholariship/core/services/websocket_manager.dart';
import 'package:scholariship/features/messages/models/conversation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConversationRepository {
  final SocketManager socketManager;
  final SharedPreferences sharedPreferences;
  final StreamController<List<Conversation>> _conversationStreamController = StreamController<List<Conversation>>.broadcast();
  final List<Conversation> _conversations = [];
  List<Conversation> get conversations => _conversations;

  String get userId => sharedPreferences.getString('user_id')!;

  ConversationRepository({required this.socketManager, required this.sharedPreferences}){
     socketManager.onEvent('chat:conversation:list:loaded', (data) {
     try {
          print('Data received from socket: $data');

          if (data is Map<String, dynamic> && data.containsKey('conversations')) {
            var conversationsFromJson = data['conversations'];
            _conversations.clear();
            for (var convJson in conversationsFromJson) {
              final conversation = Conversation.fromJson(convJson as Map<String, dynamic>);
              _conversations.add(conversation);
            }
            _conversationStreamController.add(_conversations);
          } else {
            _conversationStreamController.add([]);
          }
      
      } catch (e) {
        print('Error processing data received from socket: $e');
        _conversationStreamController.addError(e);
      }
});

  }
  Stream<List<Conversation>> get conversationStream => _conversationStreamController.stream;

  void sendMessage(String event, dynamic data) {
    socketManager.sendMessage(event, data);
  }
}
