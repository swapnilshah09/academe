import 'package:academe/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class TopStreams extends StatefulWidget {
  const TopStreams({Key key, this.callBack, this.url}) : super(key: key);

  final Function callBack;
  final String url;
  @override
  _TopStreamsState createState() => _TopStreamsState();
}

class _TopStreamsState extends State<TopStreams>
    with TickerProviderStateMixin {
  Map <dynamic,dynamic> topStreams;
  @override
  void initState() {
    super.initState();
//    getTopStreams();
    print('---------inside url-----------');
  print(widget.url);
  }

//  Future<bool> getData() async {
//    await Future<dynamic>.delayed(const Duration(seconds: 3));
//    return true;
//  }

  Future<dynamic> getStreams() async {
//    var url = 'http://159.65.154.185:89/api/topstreams';
    var response = await http.get(widget.url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      topStreams = jsonResponse['data'];
      print('Top Streams: $topStreams.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return topStreams;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder<dynamic>(
        future: getStreams(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('--------------test--------------');
          print(snapshot.data);
          print(snapshot.hasError);
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return GridView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              physics: NeverScrollableScrollPhysics(),
              children: List<Widget>.generate(
                snapshot.data['streams'].length,
                (int index) {
                  return Container(
                    height: 300,
                    child: StreamView(
                      callback: () {
                        widget.callBack();
                      },
                      stream: snapshot.data['streams'][index],
                    ),
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 32.0,
              ),
            );
          }
        },
      ),
    );
  }
}

class StreamView extends StatelessWidget {
  const StreamView(
      {Key key,
      this.stream,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final stream;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        callback();
      },
      child: SizedBox(
        height: 280,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 20, right: 16),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          stream['name'],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, left: 20, right: 16, bottom: 4),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          stream['total_courses'].toString() +
                                              ' Courses',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 24, right: 16, left: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AcademeAppTheme.grey.withOpacity(0.2),
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 6.0),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: AspectRatio(
                        aspectRatio: 1.28,
                        child:
                        Image.network('http://159.65.154.185:89/storage/Hindi-Literature.jpeg')
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
//      },
//    );
  }
}
