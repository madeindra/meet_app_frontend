class Chat {
  final int id;
  final int senderId;
  final int targetId;
  final String content;

  int get chatId {
    return id;
  }

  int get chatSender {
    return senderId;
  }

  int get chatTarget {
    return targetId;
  }

  String get chatContent {
    return content;
  }

  Chat({this.id, this.senderId, this.targetId, this.content});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['data']['id'],
      senderId: json['data']['senderId'],
      targetId: json['data']['targetId'],
      content: json['data']['content'],
    );
  }
}
