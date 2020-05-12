import 'package:academe/screens/account_sub_screen.dart';
import 'package:academe/screens/home_sub_screen.dart';
import 'package:academe/screens/more_sub_screen.dart';
import 'package:academe/screens/subscriptions_sub_screen.dart';
import 'package:academe/services/authentication_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static String id = 'my_home_page';
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
  ScreenArguments args;
  bool showSubScreen1 = false;

  @override
  void initState() {
    super.initState();


    _isAuthenticated = AuthenticationService.isAuthenticated();
    _isAuthenticated.then((value){
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
  Widget build(BuildContext context) {
      args = ModalRoute.of(context).settings.arguments;
      print('-------home-------');
      print(args != null ? args.selectScreen : '');
      print(ModalRoute.of(context).isActive);
//      this.setState((){
//        if (args != null && args.selectScreen != null) {
//          _selectedSubScreen = args.selectScreen;
//        }
//      });

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

class ScreenArguments {
  final int selectScreen;
  final bool showSubScreen1;
  ScreenArguments(this.selectScreen, this.showSubScreen1);
}
