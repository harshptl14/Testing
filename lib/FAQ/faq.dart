import 'package:clubgammatesting/photos_activity/data.dart';
import 'package:flutter/material.dart';

class FaqActivity extends StatefulWidget {
  @override
  _FaqActivityState createState() => _FaqActivityState();
}

class _FaqActivityState extends State<FaqActivity> {
  int _activeMeterIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Container(
        child: new ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                //  decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(8),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey[200],
                //       blurRadius: 10,
                //       spreadRadius: 5,
                //     )
                //   ],
                //  ),
                child: ExpansionPanelList(
                  // expandedHeaderPadding: EdgeInsets.all(100),
                  //dividerColor: Colors.red,
                  expansionCallback: (int index, bool status) {
                    setState(() {
                      _activeMeterIndex = _activeMeterIndex == i ? null : i;
                    });
                  },
                  children: [
                    new ExpansionPanel(
                      isExpanded: _activeMeterIndex == i,
                      headerBuilder: (BuildContext context, bool isExpanded) =>
                          new Container(
                              padding: const EdgeInsets.only(left: 15.0),
                              alignment: Alignment.centerLeft,
                              child: new Text(
                               data[i]["name"],
                              )),
                      body: new Container(
                        padding: EdgeInsets.only(left:15, right: 15, bottom: 15),
                        child: new Text('Club gamma is a cummunity of people, it is driven ny the people of the community'),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

/// ListTile

// import 'package:flutter/material.dart';

// class TileApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Center(
//             child: Text('ExpansionTile App'),
//           ),
//         ),
//         body: new ListView.builder(
//           itemBuilder: (BuildContext context, int index) {
//             return new StuffInTiles(listOfTiles[index]);
//           },
//           itemCount: listOfTiles.length,
//         ),
//       ),
//     );
//   }
// }

// class StuffInTiles extends StatelessWidget {
//   final MyTile myTile;
//   StuffInTiles(this.myTile);

//   @override
//   Widget build(BuildContext context) {
//     return _buildTiles(myTile);
//   }

//   Widget _buildTiles(MyTile t) {
//     if (t.children.isEmpty)
//       return new ListTile(
//           dense: true,
//           onLongPress: () => print("long press"),
//           onTap: () => print("tap"),
//           title: new Text(t.title));

//     return new ExpansionTile(
//       key: new PageStorageKey<int>(3),
//       title: new Text(t.title),
//       children: t.children.map(_buildTiles).toList(),
//     );
//   }
// }

// class MyTile {
//   String title;
//   List<MyTile> children;
//   MyTile(this.title, [this.children = const <MyTile>[]]);
// }

// List<MyTile> listOfTiles = <MyTile>[
//   new MyTile(
//     'What is club gamma? what they do?',
//     <MyTile>[
//       new MyTile(
//         'Club gamma is a cummunity of people, it is driven ny the people of the community.',
//       ),
//     ],
//   ),

//    new MyTile(
//     'What is club gamma? what they do?',
//     <MyTile>[
//       new MyTile(
//         'Club gamma is a cummunity of people, it is driven ny the people of the community.',
//       ),
//     ],
//   ),

//    new MyTile(
//     'What is club gamma? what they do?',
//     <MyTile>[
//       new MyTile(
//         'Club gamma is a cummunity of people, it is driven ny the people of the community.',
//       ),
//     ],
//   ),

//    new MyTile(
//     'What is club gamma? what they do?',
//     <MyTile>[
//       new MyTile(
//         'Club gamma is a cummunity of people, it is driven ny the people of the community.',
//       ),
//     ],
//   ),
  
// ];
