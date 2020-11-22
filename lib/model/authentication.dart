class Authentication {
  final int id;
  final String email;
  final String authToken;
  final String refreshToken;

  Authentication({this.id, this.email, this.authToken, this.refreshToken});

  factory Authentication.fromJson(Map<String, dynamic> json) {
    return Authentication(
      id: json['data']['id'],
      email: json['data']['email'],
      authToken: json['data']['authToken'],
      refreshToken: json['data']['refreshToken'],
    );
  }
}
