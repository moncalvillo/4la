import 'package:app/config/env/config.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  final String? _url = ConfigParams.serverUrl;

  late IO.Socket socket;

  SocketService() {
    socket = IO.io(_url, <String, dynamic>{
      'transports': ['websocket'],
    });
  }

  void connect(String nickname) {
    socket.onConnect(
      (_) {
        socket.emit('nickname', nickname);
      },
    );
  }

  void createRoomWithCallback(Function(String) callback) {
    socket.emit('createRoom');
    socket.once('roomCreated', (roomId) {
      callback(roomId);
    });
  }

  void addListener(String event, Function(dynamic) callback) {
    socket.on(event, (data) {
      callback(data);
    });
  }

  void removeListener(String event) {
    socket.off(event);
  }
}

final socketService = SocketService();
