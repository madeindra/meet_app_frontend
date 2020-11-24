import 'dart:developer';

class Authenticated {
  isAuthenticated() {
    return false;
  }

  void setRememberMe() {
    log('User remembered');
  }
}
