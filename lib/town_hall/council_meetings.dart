import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;

class CouncilMeetings extends StatefulWidget {
  CouncilMeetings({Key key}) : super(key: key);

  @override
  _CouncilMeetingsState createState() => _CouncilMeetingsState();
}

class _CouncilMeetingsState extends State<CouncilMeetings> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<String> futureString;

  @override
  void initState() {
    super.initState();
    futureString = fetchFacebookVideoLink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
          child: Image.asset("assets/logo_images/app_logo.png"),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 0.0, right: 0.0), // EdgeInsets.only(top: 20.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.menu,
                size: 24,
                color: Colors.black, ), //Colors.white
              onPressed: () => _scaffoldKey.currentState.openDrawer(), //_scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ],
      ),
      drawer: NavDrawer2(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 15, top: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFF979797),), //_left Icons.arrow_back
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width-80,
                    child: new Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Icon(Icons.location_city, color: Color(0x55FB6340), size: 30,),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(35.0, 6.0, 0.0, 0.0), //10.0 //25.0
                                child: Text(
                                  'Administrație locală',
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
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15 ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset("assets/images/circle_FFDECC.svg"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 90,
                        padding: EdgeInsets.only(left: 10,),
                        child: Text(
                          "Ședințe de Consiliu local",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width - 50,
                    child: Text(
                      "Vizualizează live ședințele de consiliu local.",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(
                        color: Color(0xFF38A49C),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            SizedBox(
              height: 20,
            ),
            //video
            SizedBox(
              width: MediaQuery.of(context).size.width-30,
              child:
              Container(
                child: FutureBuilder<String>( //FutureBuilder<Album>
                  future: futureString,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //return Text(snapshot.data.title);
                      return HtmlWidget(
                        snapshot.data,
                        webView: true,
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        height: (MediaQuery.of(context).size.height/2),
                        child: Center(
                          child: Text("${snapshot.error}"),
                        ),
                      );
                    }
                    return Container(
                      height: (MediaQuery.of(context).size.height/2),
                      child: Center(
                        child:
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation <Color> (Color(0xFF38A49C)),
                        ),
                        //CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),

            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> fetchFacebookVideoLink() async {
  //
  Map<String, dynamic> fd;
  http.Response r = await http.get('https://e-radauti-80139.firebaseio.com/--Sedinte.json');
  fd = json.decode(r.body);

  String link = fd['link'];
  //link = 'https://www.facebook.com/watch/?v=195642925014310&extid=L8LJHdVM1GdJpBfY';
  String html = '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
      link
      + '''"></iframe>''';

  print(html);
  return html;
}