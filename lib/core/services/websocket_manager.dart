import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketManager {
  final SharedPreferences sharedPreferences;
  IO.Socket? _socket;

  SocketManager({required this.sharedPreferences});

  // Connect to the Socket.IO server
  Future<void> connect(String url) async {
    try {
      final token = sharedPreferences.getString('access_token');
      print(token);
      _socket = IO.io(url, IO.OptionBuilder()
          .setTransports(['websocket'])
          .setExtraHeaders({
            'Authorization': 'Bearer $token'
          })
          .build()
      );
      print('Connecting to Socket.IO server');
       print(_socket!.connected);
      _socket!.onConnect((_) {
        print('Connected to Socket.IO server');
      });
      print(_socket!.connected);

      _socket!.onDisconnect((_) => print('Disconnected from Socket.IO server'));
    } catch (e) {
      print('Error connecting to Socket.IO server: $e');
    }
  }

  // Send a message
  void sendMessage(String event, dynamic data) {
    if (_socket != null) {
      print('Sending message: $event with data: $data');
      _socket!.emit(event, data);
    }
  }

  // Listen for an event
  void onEvent(String event, Function(dynamic data) callback) {
    if (_socket != null) {
      print('Listening for event: $event');
      _socket!.on(event, (data) {
        print('Received event: $event with data: $data');
        callback(data);
      });
    }
  }

  // Close the connection
  void disconnect() {
    _socket?.dispose();
    _socket = null;
  }
}
