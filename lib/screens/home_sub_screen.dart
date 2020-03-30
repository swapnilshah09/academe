import 'package:flutter/material.dart';
import 'category_list_view.dart';
import 'package:academe/constant.dart';

import 'course_info_screen.dart';
import 'course_list_view.dart';


class HomeSubScreen extends StatefulWidget {
  @override
  _HomeSubScreenState createState() => _HomeSubScreenState();
}

class _HomeSubScreenState extends State<HomeSubScreen> {
  @override
  Widget build(BuildContext context) {

    return ListView(
      //shrinkWrap: true,
      children: <Widget>[
      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              getCategoryUI(),
              Flexible(
                child: getPopularCourseUI(),
              ),
            ],
          ),
        ),
      )
      ],
    );
  }

  Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'What\'s New',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: AcademeAppTheme.darkerText,
            ),
          ),
        ),

        CategoryListView(
          callBack: () {
            moveTo();
          },
        ),
      ],
    );
  }

  Widget getPopularCourseUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Popular Course',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: AcademeAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: PopularCourseListView(
              callBack: () {
                moveTo();
              },
            ),
          )
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(),
      ),
    );
  }

}
