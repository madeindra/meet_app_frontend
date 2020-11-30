import 'package:flutter/material.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../util/websocket.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Websocket websocket = new Websocket();
  final WebSocketChannel channel =
      IOWebSocketChannel.connect('ws://10.0.2.2:8080/chat');
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    websocket.subscribe(channel);

    return new Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Text(
                        snapshot.data.toString(),
                      )
                    : Text(
                        '',
                      );
              },
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: "Enter your message here"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.send),
          onPressed: () {
            channel.sink.add(
                '{"action": "publish", "topic": "test", "message":"${controller.text}"}');
          }),
    );
  }
}
