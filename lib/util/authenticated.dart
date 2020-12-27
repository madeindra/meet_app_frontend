import 'dart:developer';

class Authenticated {
  bool isAuthenticated = false;
  bool isRemembered = false;

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
}
