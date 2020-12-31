import 'package:flutter/material.dart';

import '../util/auth.dart';

class ChatWidget extends StatelessWidget {
  final List<dynamic> data;
  final int userId = Auth().getUserId();

  ChatWidget(this.data);

  String getFriendId(int senderId, int targetId) {
    return this.userId == senderId ? targetId.toString() : senderId.toString();
  }

  String getFriendPicture(dynamic item) {
    return item["senderPicture"] ?? "";
  }

  String getFriendName(dynamic item) {
    return item["senderName"] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();

    data.forEach((item) => {
          list.add(Column(children: <Widget>[
            Text(getFriendId(item["senderId"], item["targetId"])),
            Text(getFriendPicture(item)),
            Text(getFriendName(item)),
            Text(item["content"])
          ]))
        });

    return Column(children: list);
  }
}
