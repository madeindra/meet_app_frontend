import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final dynamic data;

  ChatWidget(this.data);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();

    data.forEach((item) => {list.add(Text(item["content"]))});

    return Row(children: list);
  }
}
