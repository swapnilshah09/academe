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
        title: Text('Stream detail'),
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

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends

                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.2, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.deepPurple[700],
                    Colors.blue[600],
                  ],
                ),
              ),
              child: InkWell(
                onTap: (){

                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            '₹ 299',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Text(
                            'Purchase Course',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'What is covered in this course?',
                        style: TextStyle(fontSize: 12, color: AcademeAppTheme.lightText),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'The Political Science course is an important part of the UGC-NET. This course will take your through 25 sessions that cover Politics, Elections, Parties, and Election Commission of India.',
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
                              'All Sessions',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Spacer(),
                            Text(
                              '23 Sessions',
                              style: TextStyle(fontSize: 16, color: AcademeAppTheme.lightText),
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

