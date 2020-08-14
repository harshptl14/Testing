import 'package:flutter/material.dart';

// class EventModel {
//   var title;
//   var description;
//   var imageLink;
//   var date;
//   var time;
//   var venue;
//   var regLink;
//   List<Speaker> speaker;

//   EventModel(this.title, this.description, this.imageLink, this.date, this.time,
//       this.venue, this.regLink, this.speaker);

//   EventModel.fromJson(Map<String, dynamic> data) {
//     title = data['title'];
//     description = data['description'];
//     imageLink = data['imageLinks'];
//     date = data['date'];
//     time = data['time'];
//     venue = data['venue'];
//     regLink = data['registrationLink'];
//     //speaker = data['speakers'];
//     var list = data['speakers'] as List;
//     speaker = list.map((i) => Speaker.fromJson(i)).toList();
//   }
// }

// class Speaker {
//   var name;
//   var post;
//   var image;
//   var session;

//   Speaker(this.name, this.post, this.image, this.session);

//   Speaker.fromJson(Map<String, dynamic> data) {
//     name = data['name'];
//     post = data['post'];
//     image = data['image'];
//     session = data['session'];
//   }
// }

class Agenda {
  // add others
  List<Data> agendaList;

  Agenda(this.agendaList);
  Agenda.fromJson(Map<String, dynamic> data) {
    var list = data['agenda'] as List;
    agendaList = list.map((i) => Data.fromJson(i)).toList();
  }
}

class Data {
  var name;
  var time;
  var photo;
  var duration;
  var speaker;
  var description;

  Data(this.name, this.time, this.photo, this.duration, this.speaker,
      this.description);

  Data.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    time = data['time'];
    photo = data['photo'];
    duration = data['duration'];
    speaker = data['speaker'];
    description = data['description'];
  }
}
