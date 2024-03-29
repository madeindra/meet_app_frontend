import 'package:flutter/material.dart';
import 'package:meet_app_frontend/screen/chat.dart';
import 'package:meet_app_frontend/screen/dahboard.dart';
import 'package:meet_app_frontend/screen/match.dart';
import 'package:meet_app_frontend/screen/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var selectedItem = 0;

  List children = [
    DashboardPage(),
    MatchPage(),
    ChatPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: children[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedItem,
        onTap: (currentIndex) {
          setState(() {
            selectedItem = currentIndex;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: selectedItem == 0
                  ? Icon(Icons.near_me_rounded)
                  : Icon(Icons.near_me_outlined),
              label: 'Find'),
          BottomNavigationBarItem(
              icon: selectedItem == 1
                  ? Icon(Icons.favorite_rounded)
                  : Icon(Icons.favorite_outline_rounded),
              label: 'Match'),
          BottomNavigationBarItem(
              icon: selectedItem == 2
                  ? Icon(Icons.messenger_rounded)
                  : Icon(Icons.messenger_outline_rounded),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: selectedItem == 3
                  ? Icon(Icons.person_rounded)
                  : Icon(Icons.person_outline_rounded),
              label: 'Profile'),
        ],
      ),
    );
  }
}
