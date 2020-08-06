import 'package:clubgammatesting/photos_activity/photosScreen.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import '../photos_activity/data.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final PageController pageController =
      PageController(initialPage: 1, keepPage: true);
  int pageIx = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: timelineModel(TimelinePosition.Left));
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
      itemBuilder: centerTimelineBuilder,
      itemCount: data.length,
      physics: BouncingScrollPhysics(),
      position: position);

  TimelineModel centerTimelineBuilder(BuildContext context, int index) {
    //final data = doodles[index];
    // ignore: unused_local_variable
    print(data[index]);
    final textTheme = Theme.of(context).textTheme;
    return TimelineModel(
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              print("photos");
              print(data[index]["doodle"].length);

              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => WallScreen(
                          data[index], data[index]["doodle"].length)));
            },
            child: Ink(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 10,
                      spreadRadius: 5,
                    )
                  ]),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10, right: 220),
                    child: Text('EVENT 1', style: TextStyle(color: Color(0xffD31E3C),
                    fontSize: 13
                    ),
                    textAlign: TextAlign.start,
                    ),
                  ),

                   SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.network(data[index]['doodle'][2]),
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),

                   SizedBox(
                    height: 10,
                  ),

                    Container(
                    padding: EdgeInsets.only(right: 25),
                    child: Text(data[index]['name'], style: TextStyle(color: Colors.black,
                    fontSize: 18
                    ),
                    textAlign: TextAlign.start,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10, right: 200),
                    child: Text(data[index]['date'], style: TextStyle(color: Color(0xffD31E3C),
                    fontSize: 13
                    ),
                    textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        position: index % 2 == 0
            ? TimelineItemPosition.right
            : TimelineItemPosition.left,
        isFirst: index == 0,
        isLast: index == data.length,
        iconBackground: data[index]["iconBackground"],
        icon: data[index]["icon"]);
  }
}
