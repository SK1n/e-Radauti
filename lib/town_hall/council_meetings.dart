import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;
import 'package:expandable/expandable.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class CouncilMeetings extends StatefulWidget {
  CouncilMeetings({Key key}) : super(key: key);

  @override
  _CouncilMeetingsState createState() => _CouncilMeetingsState();
}

class _CouncilMeetingsState extends State<CouncilMeetings> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<List<dynamic>> futureL;
  List<Widget> lWidget = [];

  //2
  Widget fwButton(String child) {
    Widget returnWidget;
    returnWidget = Container(
      child: FlatButton(
        onPressed: () => UrlLauncher.launch(child),
        child: Text(
          'Ordinea de zi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        color: Color(0xFF38A49C),
        textColor: Colors.white,
        splashColor: Color(0x8838A49C),
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
      ),
    );
    return returnWidget;
  }

  //3
  Widget fw(List lGive, BuildContext bC) {
    List<Widget> lWidgetCard = [];
    Widget response;
    for (int i = 0; i < lGive.length; i++) {
      String sLink;
      if ((lGive[i]['link'].toString().contains('www.facebook.com')) ||
          (lGive[i]['link'].toString().contains('fb.watch'))) {
        sLink =
            '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
                lGive[i]['link'] +
                '''"></iframe>''';
      } else if (lGive[i]['link'].toString().contains('www.youtube.com')) {
        sLink = '''<iframe width="200" height="200" src="''' +
            lGive[i]['link'] +
            '''" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>''';
      }
      lWidget.add(
        IconButton(
          icon: Icon(Icons.play_circle_outline, color: Colors.red),
          onPressed: () {
            setState(() {
              lWidget[i] = HtmlWidget(
                sLink,
                webView: true,
              );
            });
          },
        ),
      );
      lWidgetCard.add(
        ExpandableNotifier(
          child: Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            width: MediaQuery.of(bC).size.width,
            child: Card(
              margin: const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(),
                      header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          lGive[i]['zi'].toString() +
                              '.' +
                              lGive[i]['luna'].toString() +
                              '.' +
                              lGive[i]['an'].toString(),
                        ),
                      ),
                      expanded: Container(
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: lWidget[i],
                            ),
                          ],
                        ),
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 0),
                          child: Expandable(
                            expanded: expanded,
                            theme: const ExpandableThemeData(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    response = Column(
      children: <Widget>[
        for (final card in lWidgetCard) card,
      ],
    );
    return response;
  }

  @override
  void initState() {
    super.initState();
    futureL = fetchDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrollable) {
            return [
              AppBarUiSliver(
                content: 'Ședințe de Consiliu local',
                leading: Icons.location_city,
                scaffoldKey: _scaffoldKey,
              )
            ];
          },
          body: FutureBuilder<List>(
            future: futureL,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 30,
                        child: HtmlWidget(
                          snapshot.data[0]['linkVideo'],
                          webView: true,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      fwButton(snapshot.data[0]['linkPDF']),
                      SizedBox(
                        height: 20,
                      ),
                      fw(snapshot.data[1], context),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Text("${snapshot.error}"),
                  ),
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

Future<List> fetchDataList() async {
  Map<String, dynamic> child = await fetchLiveMeetingLinks();
  List<dynamic> children = await fetchListVideoLink();
  List<dynamic> returnList = [];

  returnList = [child, children];
  return returnList;
}

Future<Map<String, dynamic>> fetchLiveMeetingLinks() async {
  Map<String, dynamic> fd;
  http.Response r = await http
      .get(Uri.parse('https://e-radauti-80139.firebaseio.com/--Sedinte.json'));
  fd = json.decode(r.body);
  Map<String, dynamic> returnMap = {};
  String link = fd['link'];
  String html;
  if ((link.toString().contains('www.facebook.com')) ||
      (link.toString().contains('fb.watch'))) {
    html =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link +
            '''"></iframe>''';
  } else if (link.toString().contains('www.youtube.com')) {
    html = '''<iframe width="200" height="200" src="''' +
        link +
        '''" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>''';
  }
  returnMap = {'linkVideo': html, 'linkPDF': fd['ordineadezi']};
  return returnMap;
}

//2
Future<List> fetchListVideoLink() async {
  Map<String, dynamic> fd;
  http.Response r = await http.get(
      Uri.parse('https://e-radauti-80139.firebaseio.com/-SedinteArhiva.json'));
  fd = json.decode(r.body);
  final List<dynamic> children = [];
  final List<dynamic> response = [];
  fd.forEach((key, value) {
    children.add(value);
  });
  for (int i = children.length - 1; i >= 0; i--) response.add(children[i]);
  return response;
}
