import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

import '../widget/chat.dart';

import '../util/websocket.dart';
import '../util/auth.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Websocket websocket = new Websocket();
  final Auth auth = new Auth();
  var futureChat;

  Future<dynamic> getList() async {
    log('Get chat list');

    final http.Response response = await http.get(
        'http://10.0.2.2:8080/api/v1/chat/details/',
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer ${auth.getAuthToken()}',
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        });

    log(response.statusCode.toString());
    log(response.body.toString());

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);

      return res["data"];
    }

    log('Failed login');
    auth.clear();
    return null;
  }

  @override
  void initState() {
    super.initState();
    futureChat = getList();
  }

  @override
  Widget build(BuildContext context) {
    websocket.init();
    WebSocketChannel channel = websocket.getChannel();

    return new Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            FutureBuilder(
                future: futureChat,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ChatWidget(snapshot.data);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
