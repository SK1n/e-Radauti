import 'package:flutter/material.dart';
import 'package:flutterapperadauti/jobs/job_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../menu_page.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  List<JobModel> jobList;
  Map<String, dynamic> jsonResponse;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List<JobModel>> _getJobs() async {
    var response = await http.get(
        "https://www.eradauti.ro/api/context?pathname=/anunturi/locuri-de-munca-20");
    this.setState(() {
      jsonResponse = json.decode(response.body);
    });
    jobList = List<JobModel>();
    jsonResponse.forEach((key, value) {
      jobList = (jsonResponse['context']['posts']['records'] as List)
          .map<JobModel>((j) => JobModel.fromJson(j))
          .toList();
    });
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
        body: Container(
          child: FutureBuilder(
            future: _getJobs(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)),
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
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      jobList[index].title.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        'Exipra pe data de: ${jobList[index].dateExpires.toString().replaceAll('T', '  ').replaceAll('Z', '  ').replaceRange(17, null, '')}'),
                                    jobList[index].price.toString() == 'null'
                                        ? Text('Nu exista un pret precizat')
                                        : Row(children: [
                                            Text(
                                              'Pret: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                jobList[index].price.toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                jobList[index]
                                                    .currency
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ]),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  onTap: () {},
                                  title: Text(jobList[index].title.toString()),
                                  subtitle: Text(
                                    jobList[index].rawContent.toString(),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Container(
                                  height: 1.0,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ],
                          ));
                    });
              }
            },
          ),
        ));
  }
}
