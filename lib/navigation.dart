import 'package:flutter/material.dart';
import 'package:latihan/dashboard.dart';
import 'package:latihan/profile.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.grey,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: <Widget>[
        Container(
          child: Dashboard(),
        ),
        Container(
          child: profile(),
        ),
      ][currentIndex],
    );
  }
}
