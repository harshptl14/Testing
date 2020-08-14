// import 'dart:convert';
// import 'package:clubgammatesting/retrivingData/eventModel.dart';
// import 'package:clubgammatesting/retrivingData/test.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:yaml/yaml.dart';

// class YamlDemo extends StatefulWidget {
//   @override
//   _YamlDemoState createState() => _YamlDemoState();
// }

// class _YamlDemoState extends State<YamlDemo> {
//   var doc;
//   String demojson;
//   var decjson;

//   @override
//   void initState() {
//     // loadfromAPI().then((value) {
//     //   setState(() {
//     //     _list.addAll(value);
//     //   });
//     // });
//     super.initState();
//   }

// List<EventModel> _list = List<EventModel>();
// Future<List<EventModel>> loadfromAPI() async {
//   var res = await http.get(
//       'https://raw.githack.com/harshptl14/Club-Gamma-App/Add-ons/events/event_details.yml');
//   // print(res.body);
//   // print('GotData');
//   // var temp = loadYaml(res.body);
//   // print(temp);
//   var list = List<EventModel>();
//   // // var temptojson = json.encode(loadYaml(res.body));
//   // // print(temptojson);
//   // var jsontolist = json.decode(json.encode(loadYaml(res.body)));
//   // return jsontolist;

//   if (res.statusCode == 200) {
//     var eventJson = json.decode(json.encode(loadYaml(res.body)));
//     for (var eventJson in eventJson) {
//       list.add(EventModel.fromJson(eventJson));
//     }
//   }
//   return list;
//   // else {
//   //   throw Exception('Failed to load Event');
//   // }
// }

//   loadfromAPI() async {
//     var res = await http.get(
//         'https://raw.githubusercontent.com/harshptl14/Club-Gamma-App/Add-ons/events/event_details.yml');
//     var jsontolist = json.decode(json.encode(loadYaml(res.body)));
//     return jsontolist;
//   }

//   // loadAsset() async {
//   //   doc = await rootBundle.loadString('assets/demo.yaml');
//   //   var temp = loadYaml(doc);
//   //   demojson = json.encode(temp[0]);
//   //   decjson = json.decode(demojson);
//   //   var temp2 = json.encode(temp[1]);
//   //   print(decjson);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: loadfromAPI(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (!snapshot.hasData) {
//             return Center(
//               child: Text('No data'),
//             );
//           } else {
//             return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (context, index) {
//                   var temp =
//                       EventModel.fromJson(snapshot.data.elementAt(index));
//                   return Column(
//                     children: [
//                       Text(temp.title),
//                       Text(temp.description),
//                       Image.network(temp.imageLink),
//                       Text(temp.date),
//                       Text(temp.time),
//                       Text(temp.venue),
//                       Text(temp.regLink),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 50.0,
//                         child: ListView.builder(
//                             itemCount: temp.speakers.length,
//                             itemBuilder: (_, index) {
//                               return Text(temp.speakers[index]);
//                             }),
//                       )
//                     ],
//                   );
//                 });
//           }
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:clubgammatesting/photos_activity/data.dart';
import 'package:clubgammatesting/photos_activity/data.dart';
import 'package:clubgammatesting/retrivingData/eventModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

class YamlDemo extends StatefulWidget {
  @override
  _YamlDemoState createState() => _YamlDemoState();
}

class _YamlDemoState extends State<YamlDemo> {
  var doc;
  String demojson;
  var decjson;

  @override
  void initState() {
    super.initState();
  }

  // Future loadPage() async {
  //   var jsonPage = await http.get('https://raw.githubusercontent.com/harshptl14/Club-Gamma-App/Add-ons/events/speaker_details.yml');
  //   final jsonResponse = json.decode(json.encode(loadYaml(jsonPage.body)));
  //   Data page = new Data.fromJson(jsonResponse);
  //   print(page.imagesList[0].name);
  // }

  loadfromAPI() async {
    var res = await http.get(
      'https://raw.githubusercontent.com/harshptl14/Club-Gamma-App/Add-ons/events/agenda_details.yml'
        //'https://raw.githubusercontent.com/harshptl14/Club-Gamma-App/Add-ons/events/event_details.yml'
        // 'https://raw.githubusercontent.com/harshptl14/Club-Gamma-App/Add-ons/events/speaker_details.yml'
        );
    print('res.body');
    print(res.body);
    // var temp = loadYaml(res.body);
    // print(temp);
    // var temptojson = json.encode(loadYaml(res.body));
    // print(temptojson);
    var jsontolist = json.decode(json.encode(loadYaml(res.body)));
    print('JsontoList');
    print(jsontolist);
    return jsontolist;
  }

  // loadAsset() async {
  //   doc = await rootBundle.loadString('assets/demo.yaml');
  //   var temp = loadYaml(doc);
  //   demojson = json.encode(temp[0]);
  //   decjson = json.decode(demojson);
  //   var temp2 = json.encode(temp[1]);
  //   print(decjson);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadfromAPI(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('No data'),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var temp =
                      Agenda.fromJson(snapshot.data.elementAt(index));
                  return Column(
                    children: [
                      // Text(temp.speaker[index].post),
                      // Text(temp.speaker[index].name),
                      //Image.network(temp.imagesList[index].image),
                      //Text(temp.time),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: ListView.builder(
                            itemCount: temp.agendaList.length,
                            itemBuilder: (_, index) {
                              print(temp.agendaList.length);
                              print(temp.agendaList[0].time);
                              print(temp.agendaList[1].time);
                              return Text(temp.agendaList[index].name);
                            }),
                      )
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
