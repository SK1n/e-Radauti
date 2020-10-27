import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/jobs/job_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../menu_page.dart';
import 'announcements_web_view.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  List<JobModel> jobList;
  Map<String, dynamic> jsonResponse;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  num _stackToView = 1;
  String errorMessage;

  Future<List<JobModel>> _getJobs() async {
    try {
      var response = await http.get(
          "https://www.eradauti.ro/api/context?pathname=/anunturi/locuri-de-munca-20");
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
    } on SocketException catch (e) {
      this.setState(() {
        _stackToView = 2;
        errorMessage = e.message.toString();
      });
    } on TimeoutException catch (e) {
      this.setState(() {
        _stackToView = 2;
        errorMessage = e.message.toString();
      });
    }
    return jobList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        leading: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
          child: Image.asset("assets/logo_images/app_logo.png"),
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
              ), //Colors.white
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ],
      ),
      drawer: NavDrawer2(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15, top: 20),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Color(0xFF979797),
                    ),
                    //_left Icons.arrow_back
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  child: new Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                              child: Icon(
                                Icons.announcement,
                                color: Color(0x55FB6340),
                                size: 30,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  35.0, 0.0, 0.0, 0.0), //10.0 //25.0
                              child: Text(
                                'Anunturi',
                                style: TextStyle(
                                  color: Color(0xFF000000), //Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IndexedStack(
            index: _stackToView,
            children: [
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 163,
                  child: FutureBuilder(
                    future: _getJobs(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF38A49C)),
                          ),
                        );
                      } else {
                        return new ListView.builder(
                            itemCount: jobList == null ? 0 : jobList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width,
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
                                                    builder: (context) =>
                                                        AnnouncementWebView(
                                                            slug:
                                                            'https://www.eradauti.ro/anunturi/locuri-de-munca-20/${jobList[index].slug.toString()}-${jobList[index].id.toString()}')))
                                          },
                                        ),
                                      )
                                    ],
                                  ));
                            });
                      }
                    },
                  ),
                ),
              ),
              Container(child: Center(child: CircularProgressIndicator())),
              Container(
                  child: Center(
                      child: Text(
                          "A aparut o eroare, va rugam sa incercati peste cateva minute!\nEroarea este urmatoarea: $errorMessage"))),
            ],
          )
        ],
      ),
    );
  }
}
