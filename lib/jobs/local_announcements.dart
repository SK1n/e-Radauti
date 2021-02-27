import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:http/http.dart' as http;

class LocalAnounnouncements extends StatefulWidget {
  LocalAnounnouncements({Key key}):super(key: key);
  @override
  _LocalAnnouncementsState createState() => _LocalAnnouncementsState();
}
class _LocalAnnouncementsState extends State<LocalAnounnouncements> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<List<dynamic>> futureL;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureL = fetchListAnnouncements();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel().loadAppBar(
          context, 'Anunțuri locale', Icons.announcement, _scaffoldKey),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: FutureBuilder<List>(
          future: futureL,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Column(
                children: [
                  for(final item in snapshot.data) listItem(context, 'Airinei Cristina', 'AirineiCristina.jpg',
                      'psd.png', '', null),
                  Text('Nota introductiva:'),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/images/psd.png"),
                      ),
                      Text('titlu imagine'),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/images/psd.png"),
                      ),
                      Text('titlu imagine'),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/images/psd.png"),
                      ),
                      Text('titlu imagine'),
                    ],
                  ),
                ],
              );
            }else if(snapshot.hasError){
              return Container(
                child: Center(
                  child: Text("Este o problemă cu încărcarea anunțurilor locale."),
                ),
              );
            };
            return Container(
              child: Center(
                child: CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)), ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<List> fetchListAnnouncements() async {
    List<dynamic> fd;
    http.Response r = await http.get('https://e-radauti-80139.firebaseio.com/-SedinteArhiva.json');
    fd = json.decode(r.body);
    final List<dynamic> children = [];
    fd.forEach((value) {children.add(value);});
    return children;
  }
  Card listItem(context, name, avatar, squareImg, phone, email) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text('------------'),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 50,
                  child: Image.asset("assets/images/$squareImg"),
                ),
                Text('------------'),
              ],
            ),
            Container(
              child: Text(
                "Data",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                "Autoritate",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                "Titlu",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                "Continut",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
