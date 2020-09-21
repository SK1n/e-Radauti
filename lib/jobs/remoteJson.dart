import 'package:flutter/material.dart';
import 'package:flutterapperadauti/jobs/furniture_page.dart';
import 'package:flutterapperadauti/jobs/job_page.dart';

class RemoteJson extends StatefulWidget {
  @override
  _RemoteJsonState createState() => _RemoteJsonState();
}

class _RemoteJsonState extends State<RemoteJson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FlatButton(
          color: Color.fromRGBO(56, 164, 156, 10),
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JobPage()),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 10,
            child: Text("Locuri de munca"),
          ),
        ),
        FlatButton(
          color: Color.fromRGBO(56, 164, 156, 10),
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FurniturePage()),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text("Imobiliare"),
          ),
        ),
      ],
    ));
  }
}
