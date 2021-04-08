import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/jobs/job_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
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
    } catch (e) {
      debugPrint('error message: $e');
    }
    return jobList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel()
          .loadAppBar(context, 'Anunțuri', Icons.announcement, _scaffoldKey),
      drawer: NavDrawer(),
      body: Card(
        elevation: 10.0,
        margin: EdgeInsets.all(10.0),
        child: FutureBuilder(
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
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blue[300]),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(10))),
                                child: Text(
                                    '${jobList[index].title.toString().toUpperCase()}'),
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
                    title: Text('Adaugati un anunt'),
                    content: Container(
                      child: Text('''
            Vizualizati pagina web apasand pe 'DA' sau 
            deschideti in browser facand click pe iconita
            '''),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: Text('DA'),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnnouncementWebView(
                                        slug:
                                            'https://www.eradauti.ro/publica-anunt-gratuit',
                                      )));
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text('NU'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoDialogAction(
                        child: Icon(Icons.open_in_browser_outlined),
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
