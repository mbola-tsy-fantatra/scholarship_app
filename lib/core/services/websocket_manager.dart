  import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketManager {
  SharedPreferences? sharedPreferences;
  static final SocketManager _instance = SocketManager._internal();

  IO.Socket? _socket;

  

  factory SocketManager(SharedPreferences sharedPreferences) {
     _instance.sharedPreferences = sharedPreferences;
     return _instance;
  }
  SocketManager._internal();

  // Connect to the Socket.IO server
  Future<void> connect(String url) async {
    try {
      final token = sharedPreferences!.getString('authToken'); 
       _socket = IO.io(url, IO.OptionBuilder()
           .setTransports(['websocket'])
           .disableAutoConnect()
           .setExtraHeaders( {
             'Authorization': 'Bearer ${token!}'
           })
           .build()
       );
      _socket!.connect();

      _socket!.onConnect((_) {
        print('Connected to Socket.IO server');
      });

      _socket!.onDisconnect((_) => print('Disconnected from Socket.IO server'));
    } catch (e) {
      print('Error connecting to Socket.IO server: $e');
    }
  }

  // Send a message
  void sendMessage(String event, dynamic data) {
    if (_socket != null) {
      _socket!.emit(event, data);
    }
  }

  // Listen for an event
  void onEvent(String event, Function(dynamic data) callback) {
    if (_socket != null) {
      _socket!.on(event, callback);
    }
  }

  // Close the connection
  void disconnect() {
    if (_socket != null) {
      _socket!.disconnect();
      _socket = null;
    }
  }
}

