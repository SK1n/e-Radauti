import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/jobs/job_model.dart';

class RemoteJson extends StatefulWidget {
  @override
  _RemoteJsonState createState() => _RemoteJsonState();
}

class _RemoteJsonState extends State<RemoteJson> {
  List<JobModel> jobList;
  Map<String, dynamic> jsonResponse;

  Future<List<JobModel>> _getJobs() async {
    var response = await http.get(
        "https://www.eradauti.ro/api/context?pathname=/anunturi/pagina-1&userID=");
    this.setState(() {
      jsonResponse = json.decode(response.body);
    });
    jobList = List<JobModel>();
    jsonResponse.forEach((key, value) {
      // print(key);
      jobList = (jsonResponse['context']['posts']['records'] as List)
          .map<JobModel>((j) => JobModel.fromJson(j))
          .toList();
      //JobModel job = JobModel.fromJson(value);
      //jobList.add(job);
    });
    print(jobList);
    // print(jobList);
    return jobList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _getJobs(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              print(jobList);
              return new ListView.builder(
                  itemCount: jobList == null ? 0 : jobList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [
                      Container(
                        child: ListTile(
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
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                        ),
                      ),
                    ]);
                  });
            }
          },
        ),
      ),
    );
  }
}
