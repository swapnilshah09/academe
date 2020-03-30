import 'package:academe/screens/email_auth_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class AccountSubScreen extends StatefulWidget {
  @override
  _AccountSubScreenState createState() => _AccountSubScreenState();
}

class _AccountSubScreenState extends State<AccountSubScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text('LOGOUT'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => EmailAuthScreen()),
                );
              })
        ],
      ),
    );
  }
}
