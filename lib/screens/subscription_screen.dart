import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  static String id = 'subscription_screen';
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(child: Text('Subscriptions Screen Will Appear Here'))
    );
  }
}
