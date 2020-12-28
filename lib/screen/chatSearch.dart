import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../model/user.dart';

import '../util/auth.dart';

class ChatSearchPage extends StatefulWidget {
  @override
  _ChatSearchPageState createState() => _ChatSearchPageState();
}

class _ChatSearchPageState extends State<ChatSearchPage> {
  final Auth auth = new Auth();
  var futureChat;

  bool isSearching = false;

  Future<List<User>> searchUser(String name) async {
    this.isSearching = true;
    final http.Response response = await http.get(
        'http://10.0.2.2:8080/api/v1/users?name=${name}',
        headers: <String, String>{
          HttpHeaders.authorizationHeader: 'Bearer ${auth.getAuthToken()}',
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        });

    log(response.statusCode.toString());
    log(response.body.toString());

    if (response.statusCode == 200) {
      final dynamic res = jsonDecode(response.body);

      return List.generate(res["data"].length, (int index) {
        return User.fromJson(res["data"][index]);
      });
    }

    log('Failed searchUser');
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
          child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Flexible(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar<User>(
              onSearch: searchUser,
              onItemFound: (User user, int index) {
                return ListTile(
                  title: Text(user.name),
                );
              },
              hintText: "Search",
              cancellationWidget: Text("Cancel"),
              emptyWidget: Center(child: Text("No user was found")),
              minimumChars: 2,
              loader: Center(
                child: Text("Searching..."),
              ),
            ),
          ))
        ],
      )),
    );
  }
}
