import 'package:academe/screens/account_sub_screen.dart';
import 'package:academe/screens/home_sub_screen.dart';
import 'package:academe/screens/more_sub_screen.dart';
import 'package:academe/screens/subscriptions_sub_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedSubScreen = 0;

  List <AppBar> appbar = [
    null,
    AppBar(title: Text('Subscriptions')),
    null,
    AppBar(title: Text('More Info'),)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar != null ? appbar[_selectedSubScreen] : null,
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
            icon: Icon(Icons.subscriptions),
            title: Text('Subscriptions'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text('More'),
          ),
        ],
        onTap: _onItemTap,
      ),
      body: showSubScreen(_selectedSubScreen),
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
        return SubscriptionsSubScreen();
      case 2:
        return AccountSubScreen();
      case 3:
        return MoreSubScreen();
    }

    return SizedBox();
  }
}
