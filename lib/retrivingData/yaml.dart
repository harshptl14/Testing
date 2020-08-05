import 'dart:convert';
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

  loadfromAPI() async {
    var res = await http.get(
        'https://raw.githubusercontent.com/clubgamma/Club-Gamma-App/master/events/event_data.yml');
    // print(res.body);
    // var temp = loadYaml(res.body);
    // print(temp);
    // var temptojson = json.encode(loadYaml(res.body));
    // print(temptojson);
    var jsontolist = json.decode(json.encode(loadYaml(res.body)));
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
                      EventModel.fromJson(snapshot.data.elementAt(index));
                  return Column(
                    children: [
                      Text(temp.title),
                      Text(temp.description),
                      Image.network(temp.imageLink),
                      Text(temp.date),
                      Text(temp.time),
                      Text(temp.venue),
                      Text(temp.regLink),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: ListView.builder(
                            itemCount: temp.speakers.length,
                            itemBuilder: (_, index) {
                              return Text(temp.speakers[index]);
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
