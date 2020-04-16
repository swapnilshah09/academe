import 'package:flutter/material.dart';
import 'package:academe/constant.dart';
import 'package:academe/utils/buttons.dart';

class PurchaseCourseScreen extends StatefulWidget {
  @override
  _PurchaseCourseScreenState createState() => _PurchaseCourseScreenState();
}

class _PurchaseCourseScreenState extends State<PurchaseCourseScreen> {
  var selectedCourseData = {
    'imagePath': 'assets/design_course/interFace3.png',
    'title': 'General Paper',
    'subtitle': '23 sessions',
    'duration': '2h 20m',
    'stream': 'UGC-NET',
    'price': 399,
    'purchaseDate': '13/04/2020',
    'sessionsCount': '23',
    'courseSummary':
        'The Political Science course is an important part of the UGC-NET. This course will take your through 25 sessions that cover Politics, Elections, Parties, and Election Commission of India.'
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Course'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Scrollbar(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    courseListTile(
                      imagePath: selectedCourseData['imagePath'],
                      title: selectedCourseData['title'],
                      subtitle: selectedCourseData['subtitle'],
                      duration: selectedCourseData['duration'],
                      stream: selectedCourseData['stream'],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Divider(
                        thickness: 0.5,
                      ),
                    ),
                    faq(
                        question: 'What is covered in the course?',
                        answer: selectedCourseData['courseSummary']),
                    faq(
                        question: 'What is number of sessions in the course?',
                        answer: selectedCourseData['sessionsCount']),
                    faq(
                        question: 'What is duration of the course?',
                        answer: selectedCourseData['duration']),
                    faq(
                        question: 'What is validity of purchase?',
                        answer:
                            'You can access this course on Academe App with a Lifetime validity.'),
                    faq(
                        question: 'Is it safe to purchase online?',
                        answer:
                            'Yes! Online purchases are 100% secure and safe. The world is moving towards e-learning.'),
                  ],
                ),
              ),
            ),
          ),
          proceedToPayButton(onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => CoursePurchasedDialog(
                  courseImagePath: selectedCourseData['imagePath'],
                  courseTitle: selectedCourseData['title'],
                  courseSubtitle: selectedCourseData['subtitle'],
                  courseDuration: selectedCourseData['duration'],
                  courseSessions: selectedCourseData['sessionsCount'],
                  courseStream: selectedCourseData['stream'],
                  coursePrice: selectedCourseData['price']),
            );
          }),
        ],
      ),
    );
  }

  Widget proceedToPayButton({@required Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 70,
        color: AcademeAppTheme.green,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 21),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '₹' + selectedCourseData['price'].toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Proceed to Pay',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget faq({@required String question, @required String answer}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          question,
          style: TextStyle(color: AcademeAppTheme.lighterText, fontSize: 16),
        ),
        SizedBox(
          height: 9,
        ),
        Text(answer, style: TextStyle(fontSize: 16)),
        SizedBox(
          height: 4,
        ),
      ],
    );
  }
}

Widget courseListTile(
    {@required String imagePath,
    @required String title,
    @required String subtitle,
    @required String duration,
    @required String stream,
    int price}) {
  return ListTile(
    isThreeLine: true,
    leading: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset(
          imagePath,
          width: 80.0,
          height: 80.0,
          fit: BoxFit.contain,
        )),
    title: Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        Spacer(),
        Text(
          duration,
          style: TextStyle(color: AcademeAppTheme.lightText, fontSize: 14),
        )
      ],
    ),
    subtitle: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              subtitle,
              style: TextStyle(color: AcademeAppTheme.lightText, fontSize: 14),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                stream,
                style:
                    TextStyle(color: AcademeAppTheme.lightText, fontSize: 12),
              ),
              Visibility(
                visible: price != null,
                child: Text(
                  '₹' + price.toString(),
                  style:
                      TextStyle(color: AcademeAppTheme.lightText, fontSize: 12),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class CoursePurchasedDialog extends StatelessWidget {
  final String courseImagePath,
      courseTitle,
      courseSubtitle,
      courseDuration,
      courseSessions,
      courseStream;
  final int coursePrice;
  CoursePurchasedDialog(
      {@required this.courseImagePath,
      @required this.courseTitle,
      @required this.courseSubtitle,
      @required this.courseDuration,
      @required this.courseSessions,
      @required this.courseStream,
      @required this.coursePrice});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 40),
                child: Icon(
                  Icons.check_circle,
                  color: AcademeAppTheme.primaryColor,
                  size: 50,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Purchase Successful',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'You can find this course any time under “Subscriptions” tab of the Academe App.',
                      style: TextStyle(color: AcademeAppTheme.lightText),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: courseListTile(
                imagePath: this.courseImagePath,
                title: this.courseTitle,
                subtitle: this.courseSubtitle,
                duration: this.courseDuration,
                stream: this.courseStream,
                price: this.coursePrice),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Buttons.primary('Start Course', () {}),
          )
        ],
      ),
    );
  }
}
