import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/jobs/job_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../widgets/src/nav_drawer.dart';
import 'announcements_web_view.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  List<JobModel> jobList;
  Map<String, dynamic> jsonResponse;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String errorMessage;

  Future<List<JobModel>> _getJobs() async {
    try {
      var response = await http.get(Uri.parse(
          "https://www.eradauti.ro/api/context?pathname=/anunturi/locuri-de-munca-20"));
      this.setState(() {
        jsonResponse = json.decode(response.body);
      });
      jobList = List<JobModel>();
      jsonResponse.forEach((key, value) {
        jobList = (jsonResponse['context']['posts']['records'] as List)
            .map<JobModel>((j) => JobModel.fromJson(j))
            .toList();
      });
    } catch (e) {
      debugPrint('error message: $e');
    }
    return jobList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppBarUiSliver(
                content: 'Anunțuri',
                leading: Icons.announcement,
                scaffoldKey: _scaffoldKey)
          ];
        },
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
                              constraints: BoxConstraints(
                                minHeight: 50,
                                maxHeight: 70,
                              ),
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blue[300]),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(10))),
                                child: Text(
                                  '${jobList[index].title.toString().toUpperCase()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AnnouncementWebView(
                                              slug:
                                                  'https://www.eradauti.ro/anunturi/locuri-de-munca-20/${jobList[index].slug.toString()}-${jobList[index].id.toString()}')))
                                },
                              ),
                            )
                          ],
                        ));
                  });
            } else {
              return LoadingScreen();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Container(
          child: Icon(Icons.add_rounded),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => CupertinoAlertDialog(
                    content: Container(
                      child: Text('''
            Doriti sa deschideti pagina web?
            '''),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('NU'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: Text('DA'),
                        onPressed: () async {
                          Navigator.pop(context);
                          if (await canLaunch(
                              'https://www.eradauti.ro/publica-anunt-gratuit')) {
                            await launch(
                                'https://www.eradauti.ro/publica-anunt-gratuit');
                          } else {
                            throw 'Could not launch https://www.eradauti.ro/publica-anunt-gratuit';
                          }
                        },
                      ),
                    ],
                  ));
        },
      ),
    );
  }
}
