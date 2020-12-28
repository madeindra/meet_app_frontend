import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class Auth {
  final box = GetStorage();

  final String authenticationStatus = "isAuthenticated";
  final String rememberedStatus = "isRemembered";
  final String authToken = "authToken";
  final String refreshToken = "refreshToken";
  final String socketTicket = "socketTicket";

  bool getAuthentication() {
    return box.read(authenticationStatus) ?? false;
  }

  void setAuthentication(bool status) {
    log('Authenticated: $status');
    box.write(authenticationStatus, status);
  }

  bool getRememberMe() {
    return box.read(rememberedStatus) ?? false;
  }

  void setRememberMe(bool status) {
    log('Remember me: $status');
    box.write(rememberedStatus, status);
  }

  String getAuthToken() {
    return box.read(authToken);
  }

  void setAuthToken(String token) {
    log('Auth token: $token');
    box.write(authToken, token);
  }

  String getRefreshToken() {
    return box.read(refreshToken);
  }

  void setRefreshToken(String token) {
    log('Refresh token: $token');
    box.write(refreshToken, token);
  }

  String getSocketTicket() {
    return box.read(socketTicket);
  }

  void setSocketTicket(String ticket) {
    log('Socket ticket: $ticket');
    box.write(socketTicket, ticket);
  }

  void clear() {
    box.remove(authenticationStatus);
    box.remove(rememberedStatus);
    box.remove(authToken);
    box.remove(refreshToken);
    box.remove(socketTicket);
  }
}
