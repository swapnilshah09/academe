import 'package:flutter/material.dart';
import 'package:academe/constant.dart';

class StreamDetailScreen extends StatefulWidget {
  @override
  _StreamDetailScreenState createState() => _StreamDetailScreenState();
}

class _StreamDetailScreenState extends State<StreamDetailScreen> {
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UGC-NET'),
      ),
      body: ListView(
        children: <Widget>[
//              Expanded(
//                child: Padding(
//                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
//                  child: SearchBar(
//                    hintText: "Search hint text",
//                    hintStyle: TextStyle(
//                      color: Colors.grey[100],
//                    ),
//                    textStyle: TextStyle(
//                      color: Colors.black,
//                      fontWeight: FontWeight.bold,
//                    ),
//                    mainAxisSpacing: 10,
//                    crossAxisSpacing: 10,
//                  ),
//                ),
//              ),

          Container(
            child: Image.asset(
                'assets/images/StreamImage1.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'About UGC-NET',
                        style: TextStyle(fontSize: 12, color: AcademeAppTheme.lightText),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'The UGC-NET is one of the top streams chosen by Indian students to extend their careers. Academe has gathered the best courses for you to successfully crack the UGC-NET exam. Start learning!',
                      style: TextStyle(fontSize: 12, color: AcademeAppTheme.lightText),

                    ),
                  )

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '22 Courses for UGC-NET',
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
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: courseData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return courseList(courseData[index]);
                      }

                  )
                ],
              ),
            ),
          ),
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
                  'View Course',
                  style: TextStyle(
                      color: AcademeAppTheme.primaryColor,
                      fontSize: 12
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

