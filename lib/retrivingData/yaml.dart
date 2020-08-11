import 'dart:convert';
import 'package:clubgammatesting/retrivingData/eventModel.dart';
import 'package:clubgammatesting/retrivingData/test.dart';
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
    loadfromAPI().then((value) {
      setState(() {
        _list.addAll(value);
      });
    });
    super.initState();
  }

  List<EventModel> _list = List<EventModel>();
  Future<List<EventModel>> loadfromAPI() async {
    var res = await http.get(
        'https://raw.githack.com/harshptl14/Club-Gamma-App/Add-ons/events/event_details.yml');
    // print(res.body);
    // print('GotData');
    // var temp = loadYaml(res.body);
    // print(temp);
    var list = List<EventModel>();
    // // var temptojson = json.encode(loadYaml(res.body));
    // // print(temptojson);
    // var jsontolist = json.decode(json.encode(loadYaml(res.body)));
    // return jsontolist;

    if (res.statusCode == 200) {
      var eventJson = json.decode(json.encode(loadYaml(res.body)));
      for (var eventJson in eventJson) {
        list.add(EventModel.fromJson(eventJson));
      }
    }
    return list;
    // else {
    //   throw Exception('Failed to load Event');
    // }
  }

  //  loadfromAPI() async {
  //   var res = await http.get(
  //       'https://raw.githack.com/harshptl14/Club-Gamma-App/Add-ons/events/event_details.yml');
  //   // print(res.body);
  //   // var temp = loadYaml(res.body);
  //   // print(temp);
  //   // var temptojson = json.encode(loadYaml(res.body));
  //   // print(temptojson);
  //   var jsontolist = json.decode(json.encode(loadYaml(res.body)));
  //   return jsontolist;
  //   // if (res.statusCode == 200) {
  //   //   return EventModel.fromJson(json.decode(res.body));
  //   // }
  //   // else{
  //   //   throw Exception('Failed to load Event');
  //   // }
  // }

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
      body:
      //  FutureBuilder(
      //   future: loadfromAPI(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (!snapshot.hasData) {
      //       return Center(
      //         child: Text('No data'),
      //       );
      //     } else {
      //       return
             ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  // var temp =
                  //     EventModel.fromJson(snapshot.data.elementAt(index));
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => Testing(_list[index])));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Text(_list[index].title),
                          Text(_list[index].description),
                          Image.network(_list[index].imageLink),
                          Text(_list[index].date),
                          Text(_list[index].time),
                          Text(_list[index].venue),
                          Text(_list[index].regLink),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            child: ListView.builder(
                                itemCount: _list[index].speakers.length,
                                itemBuilder: (_, index) {
                                  return Text(_list[index].speakers[index]);
                                }),
                          )
                        ],
                        // children: [
                        //   Text(temp.title),
                        //   Text(temp.description),
                        //   Image.network(temp.imageLink),
                        //   Text(temp.date),
                        //   Text(temp.time),
                        //   Text(temp.venue),
                        //   Text(temp.regLink),
                        //   Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     height: 50.0,
                        //     child: ListView.builder(
                        //         itemCount: temp.speakers.length,
                        //         itemBuilder: (_, index) {
                        //           return Text(temp.speakers[index]);
                        //         }),
                        //   )
                        // ],
                      ),
                    ),
                  );
                }),
          
      //   },
      // ),
    );
  }
}
