import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/jobs/announcements_web_view.dart';
import 'package:flutterapperadauti/jobs/job_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../menu_page.dart';

class FurniturePage extends StatefulWidget {
  @override
  _FurniturePageState createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  List<JobModel> jobList;
  Map<String, dynamic> jsonResponse;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  num _stackToView = 1;

  Future<List<JobModel>> _getJobs() async {
    try {
      var response = await http.get(
          "https://www.eradauti.ro/api/context?pathname=/anunturi/imobiliare-19");
      this.setState(() {
        jsonResponse = json.decode(response.body);
        _stackToView = 0;
      });
      jobList = List<JobModel>();
      jsonResponse.forEach((key, value) {
        jobList = (jsonResponse['context']['posts']['records'] as List)
            .map<JobModel>((j) => JobModel.fromJson(j))
            .toList();
      });
    } catch (e) {
      debugPrint('error: $e');
    }
    return jobList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.announcement,
              color: Color(0x55FB6340),
              size: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            Text('Anunturi'),
          ]),
          leading: Container(
            child: FlatButton(
              child: Icon(Ionicons.ios_arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          actions: <Widget>[
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 0.0, right: 0.0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 24,
                  color: Colors.black,
                ),
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ],
        ),
        drawer: NavDrawer2(),
        body: FutureBuilder(
          future: _getJobs(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return new ListView.builder(
                  itemCount: jobList == null ? 0 : jobList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: FlatButton(
                                color: Colors.blue[300],
                                padding: EdgeInsets.all(10),
                                child: Text(
                                    '${jobList[index].title.toString().toUpperCase()}'),
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AnnouncementWebView(
                                              slug:
                                              'https://www.eradauti.ro/anunturi/imobiliare-19/${jobList[index].slug.toString()}-${jobList[index].id.toString()}')))
                                },
                              ),
                            )
                          ],
                        ));
                  });
            } else {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ));
  }
}
