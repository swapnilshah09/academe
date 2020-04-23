import 'package:flutter/material.dart';
import 'package:academe/constant.dart';
import 'package:academe/components/buttons.dart';

class MoreSubScreen extends StatefulWidget {
  @override
  _MoreSubScreenState createState() => _MoreSubScreenState();
}

class _MoreSubScreenState extends State<MoreSubScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AboutAcademeDialog(),
            );
          },
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 22),
                  child: Text(
                    'About Academe',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Divider(),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => ContactUsDialog(),
            );
          },
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 22),
                  child: Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Divider(),
                )
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 28),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 34,
        ),
        Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 30, 0, 30),
                child: Image.asset(
                  'assets/images/academe_logo.png',
                  height: 30,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class AboutAcademeDialog extends StatelessWidget {
  AboutAcademeDialog();

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
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'About Academe',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Academe started in 1993 as a tution class run by John Doe. Since then, it has been continously growing and changing lives of hundreds of students who are looking for quality study material to crack the exams they’ve been preparing for and make their dreams come true.',
                        style: TextStyle(color: AcademeAppTheme.lightText),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(33, 0, 33, 33),
            child: Buttons.primary(
                text: 'Back',
                onTap: () {
                  Navigator.of(context).pop();
                }),
          )
        ],
      ),
    );
  }
}

class ContactUsDialog extends StatelessWidget {
  ContactUsDialog();

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
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Subject',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 0),
                        child: TextField(
                          //controller: _couponController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              fillColor: Colors.grey[200],
                              filled: true),
                        ),
                      ),
                      Text(
                        'Message',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 0),
                        child: TextField(
                          //controller: _couponController,
                          minLines: 4,
                          maxLines: 7,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              fillColor: Colors.grey[200],
                              filled: true),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(33, 0, 33, 33),
            child: Buttons.primary(
                text: 'Send Message',
                onTap: () {
                  Navigator.of(context).pop();
                }),
          )
        ],
      ),
    );
  }
}
