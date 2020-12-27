import 'dart:developer';

class Auth {
  bool isAuthenticated = false;
  bool isRemembered = false;

  String authToken = "";
  String refreshToken = "";
  String socketTicket = "";

  getAuthentication() {
    return isAuthenticated;
  }

  void setAuthentication(bool authenticationStatus) {
    log('Authenticated: $authenticationStatus');
    isAuthenticated = authenticationStatus;
  }

  getRememberMe() {
    return isRemembered;
  }

  void setRememberMe(bool rememberStatus) {
    log('Remember me: $rememberStatus');
    isRemembered = rememberStatus;
  }

  getAuthToken() {
    return authToken;
  }

  void setAuthToken(String token) {
    authToken = token;
  }

  getRefreshToken() {
    return refreshToken;
  }

  void setRefreshToken(String token) {
    refreshToken = token;
  }

  getSocketTicket() {
    return socketTicket;
  }

  void setSocketTicket(String ticket) {
    socketTicket = ticket;
  }
}
