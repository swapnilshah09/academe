import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({Key key, this.callBack}) : super(key: key);

  final Function callBack;
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView>
    with TickerProviderStateMixin {

  Map <dynamic,dynamic> popularCourses;

  @override
  void initState() {
    super.initState();
    getPopularCourses();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> getPopularCourses() async {
    var url = 'http://159.65.154.185:89/api/popularcourses';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      popularCourses = jsonResponse['data'];
//      print();
      print('Number of Courses about http: $popularCourses.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 134,
      width: double.infinity,
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 0, right: 16, left: 16),
              itemCount: popularCourses['courses'].length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return CategoryView(
                  category: popularCourses['courses'][index],
                  callback: () {
                    widget.callBack(popularCourses['courses'][index]);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key key,
      this.category,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final category;

  @override
  Widget build(BuildContext context) {
        return InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            callback();
          },
          child: SizedBox(
            width: 280,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 48,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(16.0)),
                          ),
                          child: Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 48 + 24.0,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 30),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              category['name'],
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
                                            top: 4.0, right: 16, bottom: 8),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              '${category['total_sessions'].toString()} lesson',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0,8.0,0,0),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              category['stream_name'],
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
                      )
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 24, bottom: 24, left: 16),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Image.network(
                                  category['courses_image'] !=null ? category['courses_image'] : 'http://159.65.154.185:89/storage/Hindi-Literature.jpeg',
                                fit: BoxFit.contain,
                              ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
