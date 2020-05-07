import 'package:academe/screens/account_sub_screen.dart';
import 'package:academe/screens/home_sub_screen.dart';
import 'package:academe/screens/more_sub_screen.dart';
import 'package:academe/screens/subscription_screen.dart';
import 'package:academe/services/authentication_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedSubScreen = 0;
  Future<bool> _isAuthenticated;
  List <AppBar> appbar = [
  null,
  AppBar(title: Text('Subscriptions')),
  null,
  AppBar(title: Text('More Info'),)
  ];
  bool authenticated = false;


  @override
  void initState() {
    super.initState();
    _isAuthenticated = AuthenticationService.isAuthenticated();
    print('-------change-------');
//    print(value);
    _isAuthenticated.then((value){
      print('-------home-------');
      print(value);
      if (value == true) {
        this.setState((){
          appbar = [
            null,
            AppBar(title: Text('Subscriptions')),
            AppBar(title: Text('Your Account')),
            AppBar(title: Text('More Info'),)
          ];
        });
      }
    });
  }


  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('-------did update--------');
    _isAuthenticated = AuthenticationService.isAuthenticated();
    print('-------change-------');
//    print(value);
    _isAuthenticated.then((value){
      print('-------home-------');
      print(value);
      if (value == true) {
        this.setState((){
          appbar = [
            null,
            AppBar(title: Text('Subscriptions')),
            AppBar(title: Text('Your Account')),
            AppBar(title: Text('More Info'),)
          ];
        });
      } else {
        this.setState((){
          appbar = [
            null,
            AppBar(title: Text('Subscriptions')),
            null,
            AppBar(title: Text('More Info'),)
          ];
        });
      }
    });
  }


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
        return SubscriptionScreen();
      case 2:
        return AccountSubScreen();
      case 3:
        return MoreSubScreen();
    }

    return SizedBox();
  }
}
