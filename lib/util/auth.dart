import 'dart:developer';

class Auth {
  bool isAuthenticated = false;
  bool isRemembered = false;

  String authToken = "";
  String refreshToken = "";
  String socketTicket = "";

  bool getAuthentication() {
    return isAuthenticated;
  }

  void setAuthentication(bool authenticationStatus) {
    log('Authenticated: $authenticationStatus');
    isAuthenticated = authenticationStatus;
  }

  bool getRememberMe() {
    return isRemembered;
  }

  void setRememberMe(bool rememberStatus) {
    log('Remember me: $rememberStatus');
    isRemembered = rememberStatus;
  }

  String getAuthToken() {
    return authToken;
  }

  void setAuthToken(String token) {
    log('Auth token: $token');
    authToken = token;
  }

  String getRefreshToken() {
    return refreshToken;
  }

  void setRefreshToken(String token) {
    log('Refresh token: $token');
    refreshToken = token;
  }

  String getSocketTicket() {
    return socketTicket;
  }

  void setSocketTicket(String ticket) {
    log('Socket ticket: $ticket');
    socketTicket = ticket;
  }
}
