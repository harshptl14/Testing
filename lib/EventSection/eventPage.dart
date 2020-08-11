import 'package:clubgammatesting/photos_activity/data.dart';
import 'package:clubgammatesting/photos_activity/photosScreen.dart';
import 'package:flutter/material.dart';

DateTime date;
class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: EventPagee(),
        ),
      ),
    );
  }
}

class EventPagee extends StatefulWidget {
  const EventPagee({
    Key key,
  }) : super(key: key);

  @override
  _EventPageeState createState() => _EventPageeState();
}

class _EventPageeState extends State<EventPagee> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Container(
        
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: 
          DateTime.parse(data[index]["date"]).isBefore(DateTime.now()) == true ?           
          InkWell(
            
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
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.88,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ]),
              child:
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                                          child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.01,
                                                   color: Color(0xffD31E3C),
                        ),
                      ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.87,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        data[index]['name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),

                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 15),
                        child: Text(
                          data[index]['content'],
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'In your phone',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                        textAlign: TextAlign.start,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Container(
                        alignment: Alignment.center,
                        // padding: EdgeInsets.only(top: 10, left: 30),
                        child: Text(
                          '${data[index]['date']} ${data[index]['time']}',
                          style: TextStyle(
                            color: Color(0xffD31E3C),
                          ),
                        ),
                        //color: Color(0xffffcccc),
                        decoration: BoxDecoration(
                          color: Color(0xffffcccc),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        width: MediaQuery.of(context).size.width * 0.46,
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                    ),
                  ],
              ),
                ),
                ],
              ),
            ),
          ) : null,
        ),
      ),
    );
  }
}
