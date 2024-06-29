import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketManager {
  final SharedPreferences sharedPreferences;
  IO.Socket? _socket;
  String? _accessToken;
  SocketManager({required this.sharedPreferences});

  // Connect to the Socket.IO server
  Future<void> connect(String url, String? accessToken) async {
    _accessToken = accessToken;
    try {
      _accessToken ??= sharedPreferences.getString('access_token');
      _socket = IO.io(url, IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setExtraHeaders({
            'Authorization': 'Bearer $_accessToken'
          })
          .build()
      );
      _socket!.connect();
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

  Future<void> updateAccessToken(String newAccessToken) async {
    _accessToken = newAccessToken;

    if (_socket != null) {
      disconnect();
    }
    await connect('${dotenv.env['SOCKET_URL']}', _accessToken!);
  }

  // Close the connection
  void disconnect() {
    _socket?.dispose();
    _socket = null;
  }
}
