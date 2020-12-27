import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'screen/homepage.dart';
import 'screen/register.dart';
import 'screen/login.dart';
import 'util/auth.dart';

void main() async {
  await GetStorage.init();

  final Auth auth = new Auth();
  Widget home = new HomePage();

  if (!auth.getAuthentication() && !auth.getRememberMe()) {
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
