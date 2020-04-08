import 'package:academe/screens/account_sub_screen.dart';
import 'package:flutter/material.dart';
import 'home_sub_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedSubScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academe'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        currentIndex: _selectedSubScreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text('Subscription'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Support'),
          ),
        ],
        onTap: _onItemTap,
      ),
      body: SafeArea(child: showSubScreen(_selectedSubScreen)),
    );
  }

  void _onItemTap(int index) async {
    if (index != _selectedSubScreen) {
      setState(() {
        _selectedSubScreen = index;
      });
    }
  }

  Widget showSubScreen(int index) {
    switch (index) {
      case 0:
        return HomeSubScreen();
      case 1:
        return AccountSubScreen();
//        return BookingsScreen(user: user);
      case 2:
        return AccountSubScreen();
      case 3:
//        return SupportSubScreen();
    }

    return SizedBox();
  }
}
