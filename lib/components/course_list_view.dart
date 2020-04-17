import 'package:academe/constant.dart';
import '../screens/models/category.dart';
//import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';

class PopularCourseListView extends StatefulWidget {
  const PopularCourseListView({Key key, this.callBack}) : super(key: key);

  final Function callBack;
  @override
  _PopularCourseListViewState createState() => _PopularCourseListViewState();
}

class _PopularCourseListViewState extends State<PopularCourseListView>
    with TickerProviderStateMixin {
//  AnimationController animationController;
  @override
  void initState() {
//    animationController = AnimationController(
//        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return GridView(
              shrinkWrap: false,
              padding: const EdgeInsets.all(8),
//              physics: const BouncingScrollPhysics(),
//              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              children: List<Widget>.generate(
                Category.popularCourseList.length,
                (int index) {
                  final int count = Category.popularCourseList.length;
//                  final Animation<double> animation =
//                      Tween<double>(begin: 0.0, end: 1.0).animate(
//                    CurvedAnimation(
//                      parent: animationController,
//                      curve: Interval((1 / count) * index, 1.0,
//                          curve: Curves.fastOutSlowIn),
//                    ),
//                  );
//                  animationController.forward();
                  return Container(
                    height: 300,
                    child: CategoryView(
                      callback: () {
                        widget.callBack();
                      },
                      category: Category.popularCourseList[index],
//                    animation: animation,
//                    animationController: animationController,
                    ),
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 32.0,
//                childAspectRatio: 0.8,
              ),
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
//      this.animationController,
//      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final Category category;
//  final AnimationController animationController;
//  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//      animation: animationController,
//      builder: (BuildContext context, Widget child) {
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
//                                color: HexColor('#F8FAFB'),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
                        // border: new Border.all(
                        //     color: AcademeAppTheme.notWhite),
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
                                          category.title,
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
                                          category.lessonCount.toString() +
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
                        child: Image.asset(category.imagePath)),
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
