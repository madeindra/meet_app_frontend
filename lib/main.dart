import 'package:flutter/material.dart';

import './homepage.dart';
import './register.dart';
import './login.dart';

void main() {
  Widget home = new HomePage();

  if (true) {
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
