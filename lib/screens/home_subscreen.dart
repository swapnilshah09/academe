import 'package:academe/components/new_courses.dart';
import 'package:flutter/material.dart';
import 'package:academe/screens/course_detail_screen.dart';
import 'package:academe/screens/stream_detail.dart';
import 'package:flutter/material.dart';
//import '../components/category_list_view.dart';
import 'package:academe/constant.dart';
//import '../components/course_list_view.dart';
import 'package:academe/components/slider.dart';
import 'package:academe/components/buttons.dart';

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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8),
          child: OffersSlider(sliderData: [
            'assets/images/Banner1.png',
            'assets/images/Banner2.png',
            'assets/images/Banner3.png'
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15, right: 16),
          child: Text(
            'What\'s New',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: 1.0),
          ),
        ),
        NewCourses(
          callBack: (popularCourses) {
            moveToCourseDetailScreen(popularCourses);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Top Streams',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 1.0),
              ),
              Buttons.miniPrimaryButton('View All', () {
                //Navigate to all streams
              })
            ],
          ),
        ),
      ],
    );
  }

  void moveToCourseDetailScreen(Map<dynamic, dynamic> popularCourses) {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseDetailScreen(
          popularCourses: popularCourses,
        ),
      ),
    );
  }
}
