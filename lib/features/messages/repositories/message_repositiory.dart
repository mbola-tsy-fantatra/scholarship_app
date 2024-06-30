import 'dart:async';

import 'package:scholariship/core/services/websocket_manager.dart';
import 'package:scholariship/features/messages/models/conversation.dart';
import 'package:scholariship/features/messages/models/messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageRepository{
  final SocketManager socketManager;
  final SharedPreferences sharedPreferences;
  final StreamController<Conversation?> _conversationStreamController = StreamController<Conversation>.broadcast();
  final StreamController<String> _typingController = StreamController<String>.broadcast();
  Stream<String> get typingStream => _typingController.stream;
  
  Conversation? _conversation;
  String get userId => sharedPreferences.getString('user_id')!;
  MessageRepository({ required this.socketManager, required this.sharedPreferences}){
    socketManager.onEvent('chat:conversation:messages', (data) {
        handleChatConversationMessagesEvent(data);
    });
    socketManager.onEvent('chat:message:new', (data){
        handleMessageReceivedEvent(data);
    });
    socketManager.onEvent('chat:conversation:error', (data){
       _conversationStreamController.addError(data);
    });
  }
  Conversation get conversation => _conversation!;
  void handleChatConversationMessagesEvent(Map<String, dynamic> data){
        try {
          print('Data received from socket: $data');
          if (data.containsKey('conversation')) {
             _conversation = Conversation.fromJson(data['conversation'] as Map<String, dynamic>);
          } else {
            _conversationStreamController.add(null);
          }
          _conversationStreamController.add(_conversation);
      } catch (e) {
        print('Error processing data received from socket: $e');
        _conversationStreamController.addError(e);
  }}

  void handleMessageReceivedEvent(Map<String, dynamic> data) {
    try {
      print('Message received from socket: $data');
      if (data.containsKey('message') && _conversation != null) {
        final message = Message.fromJson(data['message'] as Map<String, dynamic>);
        _conversation!.messages.insert(0, message);
        _conversationStreamController.add(_conversation);
      }
    } catch (e) {
      print('Error processing message received from socket: $e');
      _conversationStreamController.addError(e);
    }
  }
  
  Stream<Conversation?> get conversationStream => _conversationStreamController.stream;

  void sendMessage(String event, dynamic data) {
    socketManager.sendMessage(event, data);
  }
  void dispose(){
    _conversationStreamController.close();
  }

}