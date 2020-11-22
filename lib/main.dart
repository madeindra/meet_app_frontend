import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'register.dart';

import './model/authentication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => new RegisterPage()
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<Authentication> postLogin(String email, String password) async {
    log('Start login');

    if (email.isNotEmpty && password.isNotEmpty) {
      final http.Response response = await http.post(
          'http://10.0.2.2:8080/api/v1/authentication/login',
          headers: <String, String>{
            HttpHeaders.authorizationHeader: 'Basic Zm9vOmJhcg==',
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{'email': email, 'password': password}));

      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        return Authentication.fromJson(jsonDecode(response.body));
      }
    }

    log('Failed login');
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 125, 0, 0),
                  child: Text(
                    'Let\'s',
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 215, 0, 0),
                  child: Text(
                    'Meet',
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(205, 218, 0, 0),
                  child: Text(
                    '!',
                    style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[400]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: InkWell(
                    onTap: () {
                      log('Forgot Password clicked');
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 45,
                  width: 250,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.blueAccent,
                    color: Colors.blue,
                    elevation: 7,
                    child: GestureDetector(
                      onTap: () async {
                        log('Login Button Clicked');

                        final userEmail = emailController.text.trim();
                        final userPassword = passwordController.text.trim();

                        var _authenticatedUser;

                        setState(() {
                          _authenticatedUser =
                              postLogin(userEmail, userPassword);
                        });

                        if (await _authenticatedUser != null) {
                          Toast.show("Login Successful", context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                          return;
                        }
                        Toast.show("Login Failed", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      },
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'New to Meet ?',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                  log('Register clicked');
                  Navigator.of(context).pushNamed('/register');
                },
                child: Text(
                  'Register Now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
