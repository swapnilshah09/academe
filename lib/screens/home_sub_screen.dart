import 'package:academe/components/new_courses.dart';
import 'package:academe/components/top_streams.dart';
import 'package:academe/screens/course_detail_screen.dart';
import 'package:academe/screens/stream_detail.dart';
import 'package:flutter/material.dart';
//import '../components/category_list_view.dart';
import 'package:academe/constant.dart';
//import '../components/course_list_view.dart';
import 'package:academe/components/slider.dart';


class HomeSubScreen extends StatefulWidget {
  @override
  _HomeSubScreenState createState() => _HomeSubScreenState();
}

class _HomeSubScreenState extends State<HomeSubScreen> {
//  List sliderData = new List();
//  sliderData[''];


  @override
  Widget build(BuildContext context) {
    return ListView(
      //shrinkWrap: true,
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing:1.4
            ),
          ),
        ),

        NewCourses(
          callBack: (popularCourses) {
            moveToCourseDetailScreen(popularCourses);
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
          Row(
            children: <Widget>[
              Text(
                'Top Streams',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  letterSpacing: 1.4,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: (){

                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.deepPurple,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                        'View All',
                      style: TextStyle(
                          color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Flexible(
            child: TopStreams(
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
        builder: (BuildContext context) => StreamDetailScreen(),
      ),
    );
  }

  void moveToCourseDetailScreen(Map<dynamic,dynamic> popularCourses) {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseDetailScreen(popularCourses: popularCourses,),
      ),
    );
  }
}
