import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  for(int i = snapshot.data.length-1; i >= 0; i--) listItem(context, snapshot.data[i]['imageUrl'], snapshot.data[i]['data'],
                      snapshot.data[i]['organizator'], snapshot.data[i]['titlul'], snapshot.data[i]['continut']),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('Tipruri de importanță:'),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.network(linkImage('gs://e-radauti-80139.appspot.com/Anunturi_logo/WarningSignBlue.png')),
                          ),
                          Text('Anunț general'),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.network(linkImage("gs://e-radauti-80139.appspot.com/Anunturi_logo/WarningSignYellow.png")),
                          ),
                          Text('Mediu'),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.network(linkImage("gs://e-radauti-80139.appspot.com/Anunturi_logo/WarningSignRed.png")),
                          ),
                          Text('Critic'),
                        ],
                      ),
                  ),
                ],
              );
            }else if(snapshot.hasError){
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text("Este o problemă cu încărcarea anunțurilor locale."),
                ),
              );
            };
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)), ),
              ),
            );
          },
        ),
      ),
    );
  }

  String linkImage(image){
    String imageLink1;
    imageLink1 =
    'https://firebasestorage.googleapis.com/v0/b/e-radauti-80139.appspot.com/o/Anunturi_logo%2F';
    String imageLink2;
    imageLink2 = '?alt=media&token=1a429f07-6cef-4de2-940f-0f839b2db3ff';

    final regExp = RegExp(r'gs://e-radauti-80139.appspot.com/Anunturi_logo/');

    String imageReturn;
    imageReturn = imageLink1 +
        image.replaceAll(regExp, '') +
        imageLink2;
    return imageReturn;
  }
  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Nu pot încărca $link';
    }
  }
  Future<List> fetchListAnnouncements() async {
    Map<String, dynamic> fd;
    http.Response r = await http.get('https://e-radauti-80139.firebaseio.com/--Anunturi.json');
    fd = json.decode(r.body);
    final List<dynamic> children = [];
    fd.forEach((key, value) {children.add(value);});
    return children;
  }
  Card listItem(context, image, date, institution, title, content) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10,),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('------------'),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 50,
                  child: Image.network(linkImage("$image")),
                ),
                Text('------------'),
              ],
            ),
            Container(
              child: Text(
                "$date",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              child: Text(
                "$institution",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 90,
              child: Text(
                "$title",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Linkify(
                onOpen: _onOpen,
                text: "$content",
              ),
            ),
          ],
        ),
      ),
    );
  }
}