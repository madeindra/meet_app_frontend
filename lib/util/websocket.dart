import 'package:web_socket_channel/web_socket_channel.dart';

class Websocket {
  void subscribe(WebSocketChannel channel) {
    channel.sink.add('{"action": "subscribe", "topic": "test"}');
  }
}
