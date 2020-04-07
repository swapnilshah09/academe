import 'package:academe/screens/email_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:academe/constant.dart';
class AccountSubScreen extends StatefulWidget {
  @override
  _AccountSubScreenState createState() => _AccountSubScreenState();
}

class _AccountSubScreenState extends State<AccountSubScreen> {

  var courseData = <Map> [
    {
      'imagePath': 'assets/design_course/interFace3.png',
      'title': 'User interface Design',
      'subtitle': '23 sessions',
      'duration': '2h 20m',
      'money': 399,
      'purchaseDate': '13/04/2020',
    },
    {
      'imagePath': 'assets/design_course/interFace4.png',
      'title': 'User interface Design',
      'subtitle': '23 sessions',
      'duration': '2h 20m',
      'money': 399,
      'purchaseDate': '13/04/2020',
    },
    {
      'imagePath': 'assets/design_course/interFace4.png',
      'title': 'User interface Design',
      'subtitle': '23 sessions',
      'duration': '2h 20m',
      'money': 399,
      'purchaseDate': '13/04/2020',
    },
    {
      'imagePath': 'assets/design_course/interFace3.png',
      'title': 'User interface Design',
      'subtitle': '23 sessions',
      'duration': '2h 20m',
      'money': 399,
      'purchaseDate': '13/04/2020',
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
          height: 100,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(top:8.0, left: 16, right: 16, bottom: 8),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hello,',
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                            'Swapnil Shah',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Edit profile',
                        style: TextStyle(
                          fontSize: 14,
                          color: AcademeAppTheme.green,
                          fontWeight: FontWeight.w700
                        ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Recent Purchases',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ListView.builder(
//                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: courseData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return courseList(courseData[index]);
                    }

                )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget courseList(Map data) {
    return ListTile(
      isThreeLine: true,
      contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            data['imagePath'],
            width: 80.0,
            height: 80.0,
            fit: BoxFit.contain,
          )
      ),
      title: Row(
        children: <Widget>[
          Text(
            data['title'],
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16
            ),
          ),
          Spacer(),
          Text(
            data['duration'],
            style: TextStyle(
                color: AcademeAppTheme.lightText,
                fontSize: 12
            ),
          )
        ],
      ),
      subtitle: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                data['subtitle'],
                style: TextStyle(
                    color: AcademeAppTheme.lightText,
                    fontSize: 12
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              children: <Widget>[
                Text(
                  data['money'].toString(),
                  style: TextStyle(
                      color: AcademeAppTheme.lightText,
                      fontSize: 12
                  ),
                ),
                Spacer(),
                Text(
                  'Purchase on '+data['purchaseDate'],
                  style: TextStyle(
                      color: AcademeAppTheme.lightText,
                      fontSize: 12
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
