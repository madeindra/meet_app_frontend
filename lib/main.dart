import 'package:flutter/material.dart';

import 'screen/homepage.dart';
import 'screen/register.dart';
import 'screen/login.dart';
import 'util/authenticated.dart';

void main() {
  final authenticated = Authenticated();
  Widget home = new HomePage();

  if (!authenticated.isAuthenticated()) {
    home = new LoginPage();
  }

  runApp(MyApp(defaultHome: home));
}

class MyApp extends StatelessWidget {
  final Widget defaultHome;
  MyApp({this.defaultHome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/register': (BuildContext context) => new RegisterPage(),
        '/home': (BuildContext context) => new HomePage(),
      },
      home: defaultHome,
    );
  }
}
