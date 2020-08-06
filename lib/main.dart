import 'package:clubgammatesting/photos_activity/TimelineTesting.dart';
import 'package:flutter/material.dart';

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
        //YamlDemo(), 
        //FaqActivity()
        Timeline(),
        );
  }
}
