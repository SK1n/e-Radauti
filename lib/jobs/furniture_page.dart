import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/jobs/announcements_web_view.dart';
import 'package:flutterapperadauti/jobs/job_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../widgets/src/nav_drawer.dart';

class FurniturePage extends StatefulWidget {
  @override
  _FurniturePageState createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  List<JobModel> jobList;
  Map<String, dynamic> jsonResponse;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List<JobModel>> _getJobs() async {
    try {
      var response = await http.get(Uri.parse(
          "https://www.eradauti.ro/api/context?pathname=/anunturi/imobiliare-19"));
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
      debugPrint('error: $e');
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
              scaffoldKey: _scaffoldKey,
            )
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
                                maxHeight: 70,
                                minHeight: 50,
                              ),
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue[300]),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(10))),
                                child: Text(
                                  '${jobList[index].title.toString().toUpperCase()}',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
