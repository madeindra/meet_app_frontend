class Chat {
  final int id;
  final int senderId;
  final String senderName;
  final String senderPicture;
  final int targetId;
  final String content;

  int get chatId {
    return id;
  }

  int get chatSender {
    return senderId;
  }

  String get chatName {
    return senderName;
  }

  String get chatPicture {
    return senderPicture;
  }

  int get chatTarget {
    return targetId;
  }

  String get chatContent {
    return content;
  }

  Chat(
      {this.id,
      this.senderId,
      this.senderName,
      this.senderPicture,
      this.targetId,
      this.content});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['data']['id'],
      senderId: json['data']['senderId'],
      senderName: json['data']['senderName'],
      senderPicture: json['data']['senderPicture'],
      targetId: json['data']['targetId'],
      content: json['data']['content'],
    );
  }
}
