import 'dart:developer';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import './auth.dart';

class Websocket {
  final Auth auth = new Auth();

  String ticket;
  WebSocketChannel channel;

  getChannel() {
    return channel;
  }

  void init() {
    log("Socket ticket: ${auth.getSocketTicket()}");

    this.ticket = auth.getSocketTicket();
    this.channel = IOWebSocketChannel.connect(
        'ws://10.0.2.2:8080/chat?ticket=${this.ticket}');

    this.channel.sink.add('{"action": "subscribe"}');
  }

  void close() {
    this.channel.sink.add('{"action": "unsubscribe"}');
    this.channel.sink.close();
  }

  void send(int targetId, String content) {
    this.channel.sink.add(
        '{"action": "publish", "data": {"targetId": $targetId, "content": "$content"}}');
  }
}
