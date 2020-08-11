import 'package:clubgammatesting/retrivingData/eventModel.dart';
import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  var tempp;
  Testing(this.tempp);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: Text(widget.tempp.title),
      ),
      
    );
  }
}