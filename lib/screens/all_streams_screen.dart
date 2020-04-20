import 'package:flutter/material.dart';
import 'package:academe/components/streams_view.dart';
class AllStreams extends StatefulWidget {
  @override
  _AllStreamsState createState() => _AllStreamsState();
}

class _AllStreamsState extends State<AllStreams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Streams'),
      ),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            StreamsView(
              callBack: (){},
              url: 'http://159.65.154.185:89/api/streamlist',
            )
          ],
        ),
      ),
    );
  }
}
