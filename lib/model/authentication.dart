class Authentication {
  final int id;
  final String email;
  final String authToken;
  final String refreshToken;
  final String ticket;

  int get userId {
    return id;
  }

  String get userEmail {
    return email;
  }

  String get userAuthToken {
    return authToken;
  }

  String get userRefreshToken {
    return refreshToken;
  }

  String get userTicket {
    return ticket;
  }

  Authentication(
      {this.id, this.email, this.authToken, this.refreshToken, this.ticket});

  factory Authentication.fromJson(Map<String, dynamic> json) {
    return Authentication(
      id: json['data']['id'],
      email: json['data']['email'],
      authToken: json['data']['token'],
      refreshToken: json['data']['refreshToken'],
      ticket: json['data']['ticket'],
    );
  }
}
