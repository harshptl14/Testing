import 'package:clubgammatesting/FAQ/faq.dart';
import 'package:clubgammatesting/photos_activity/photosScreen.dart';
import 'package:clubgammatesting/retrivingData/yaml.dart';
import 'package:flutter/material.dart';
import 'photos_activity/timeline.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Timeline Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
        YamlDemo(), 
        //FaqActivity()
        //TimelinePage(title: 'Muslim Civilisation Doodles'),
        );
  }
}
