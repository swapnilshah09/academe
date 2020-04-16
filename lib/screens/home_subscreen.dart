import 'package:flutter/material.dart';
import 'package:academe/screens/course_detail_screen.dart';
import 'package:academe/screens/stream_detail.dart';
import 'package:flutter/material.dart';
import 'category_list_view.dart';
import 'package:academe/constant.dart';
import 'course_list_view.dart';
import 'package:academe/components/slider.dart';

class HomeSubScreenNew extends StatefulWidget {
  @override
  _HomeSubScreenNewState createState() => _HomeSubScreenNewState();
}

class _HomeSubScreenNewState extends State<HomeSubScreenNew> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome to',
                style: TextStyle(
                    color: AcademeAppTheme.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'assets/images/academe_logo.png',
                height: 30,
              ),
            ],
          ),
        ),
        OffersSlider(sliderData: [
          'assets/images/Banner1.png',
          'assets/images/Banner2.png',
          'assets/images/Banner3.png'
        ]),
      ],
    );
  }
}
