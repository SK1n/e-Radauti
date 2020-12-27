import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;
import 'package:expandable/expandable.dart';

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
    //luni video 2020
    //1
    String link1;
    link1 =
        'https://www.facebook.com/watch/?v=195642925014310&extid=L8LJHdVM1GdJpBfY';
    String html1 =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link1 +
            '''"></iframe>''';
    //2_a
    String link2_a;
    link2_a = 'https://www.facebook.com/watch/?v=527048061526536';
    String html2_a =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link2_a +
            '''"></iframe>''';
    //2_b
    String link2_b;
    link2_b = 'https://www.facebook.com/watch/?v=195642925014310';
    String html2_b =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link2_b +
            '''"></iframe>''';
    //2_c
    String link2_c;
    link2_c = 'https://www.facebook.com/watch/?v=881982478897029';
    String html2_c =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link2_c +
            '''"></iframe>''';
    //2_d
    String link2_d;
    link2_d = 'https://www.facebook.com/watch/?v=145901219860706';
    String html2_d =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link2_d +
            '''"></iframe>''';
    //3
    String link3;
    link3 =
        'https://www.facebook.com/watch/?v=195642925014310&extid=L8LJHdVM1GdJpBfY';
    String html3 =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link3 +
            '''"></iframe>''';
    //4_1
    String link4_1;
    link4_1 = 'https://www.youtube.com/embed/16IXjXzZOdg';
    String html4_1 = '''<iframe width="200" height="200" src="''' +
        link4_1 +
        '''" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>''';
    //4_2_a
    String link4_2_a;
    link4_2_a = 'https://www.facebook.com/watch/?v=258508995290327';
    String html4_2_a =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link4_2_a +
            '''"></iframe>''';
    //4_2_b
    String link4_2_b;
    link4_2_b = 'https://www.facebook.com/watch/?v=251744472688298';
    String html4_2_b =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link4_2_b +
            '''"></iframe>''';
    //4_2_c
    String link4_2_c;
    link4_2_c = 'https://www.facebook.com/watch/?v=3176855102364744';
    String html4_2_c =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link4_2_c +
            '''"></iframe>''';
    //5_1
    String link5_1;
    link5_1 = 'https://www.youtube.com/embed/IUloEjTCdsw';
    String html5_1 = '''<iframe width="200" height="200" src="''' +
        link5_1 +
        '''" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>''';
    //5_2
    String link5_2;
    link5_2 = 'https://www.youtube.com/embed/q12t3Gy66Qw';
    String html5_2 = '''<iframe width="200" height="200" src="''' +
        link5_2 +
        '''" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>''';
    //6_1
    String link6_1;
    link6_1 = 'https://www.facebook.com/watch/?v=2959925820729473';
    String html6_1 =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link6_1 +
            '''"></iframe>''';
    //6_2
    String link6_2;
    link6_2 = 'https://www.youtube.com/embed/87VPWsqE5PM';
    String html6_2 = '''<iframe width="200" height="200" src="''' +
        link6_2 +
        '''" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>''';
    //7
    String link7;
    link7 = 'https://www.facebook.com/watch/?v=625724974735957';
    String html7 =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link7 +
            '''"></iframe>''';
    //8_1
    String link8_1;
    link8_1 = 'https://www.youtube.com/embed/P-_2K4mqRFY';
    String html8_1 = '''<iframe width="200" height="200" src="''' +
        link8_1 +
        '''" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>''';
    //8_2
    String link8_2;
    link8_2 = 'https://www.facebook.com/watch/?v=1411023909093181';
    String html8_2 =
        '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
            link8_2 +
            '''"></iframe>''';
    //9
    String link9;
    link9 = 'https://www.youtube.com/embed/gj8cyNSz_6Y';
    String html9 = '''<iframe width="200" height="200" src="''' +
        link9 +
        '''" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>''';

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel().loadAppBar(
          context, 'Administrație locală', Icons.location_city, _scaffoldKey),
      drawer: NavDrawer(),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Color(0xAA38A49C), //Colors.blue
          useInkWell: true,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                              "assets/images/circle_FFDECC.svg"),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 90,
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
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
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 1.0,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //video
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: Container(
                  child: FutureBuilder<String>(
                    //FutureBuilder<Album>
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
                          height: 250,
                          child: Center(
                            child: Text("${snapshot.error}"),
                          ),
                        );
                      }
                      return Container(
                        height: 250,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF38A49C)),
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

              //luna 9
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "17 Septembrie 2020",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 200,
                                      child: Container(
                                        child: HtmlWidget(
                                          html9,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
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

              //luna 8_2
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "31 August 2020",
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Container(
                                        child: HtmlWidget(
                                          html8_2,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
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

              //luna 8_1
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "27 August 2020",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 200,
                                      child: Container(
                                        child: HtmlWidget(
                                          html8_1,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
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

              //luna 7
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "30 Iulie 2020",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Container(
                                        child: HtmlWidget(
                                          html7,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
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

              //luna 6_2
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "23 Iunie 2020",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 200,
                                      child: Container(
                                        child: HtmlWidget(
                                          html6_2,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
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

              //luna 6_1
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "17 Iunie 2020",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Container(
                                        child: HtmlWidget(
                                          html6_1,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
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

              //luna 5_2
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "27 Mai 2020",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 200,
                                      child: Container(
                                        child: HtmlWidget(
                                          html5_2,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
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

              //luna 5_1
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "13 Mai 2020",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 200,
                                      child: Container(
                                        child: HtmlWidget(
                                          html5_1,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
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

              //luna 4_2
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "30 Aprilie 2020",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //3
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Container(
                                        child: HtmlWidget(
                                          html4_2_c,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //2
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Container(
                                        child: HtmlWidget(
                                          html4_2_b,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Container(
                                        child: HtmlWidget(
                                          html4_2_a,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
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

              //luna 4_1
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "1 Aprilie 2020",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 200,
                                      child: Container(
                                        child: HtmlWidget(
                                          html4_1,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
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
              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin:
                        const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(
                              5), //const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[],
                              ),
                              Column(
                                children: <Widget>[],
                              ),
                            ],
                          ),
                        ),
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "20 Februarie 2020",
                                      // ignore: deprecated_member_use
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )),
                            collapsed: Text(
                              '',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //4
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Container(
                                        child: HtmlWidget(
                                          html2_d,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //3
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Container(
                                        child: HtmlWidget(
                                          html2_c,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //2
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Container(
                                        child: HtmlWidget(
                                          html2_b,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    child: //video
                                        SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Container(
                                        child: HtmlWidget(
                                          html2_a,
                                          webView: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0),
                                child: Expandable(
                                  //collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
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
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> fetchFacebookVideoLink() async {
  //
  Map<String, dynamic> fd;
  http.Response r =
      await http.get('https://e-radauti-80139.firebaseio.com/--Sedinte.json');
  fd = json.decode(r.body);

  String link = fd['link'];
  //link = 'https://www.facebook.com/watch/?v=195642925014310&extid=L8LJHdVM1GdJpBfY';
  String html =
      '''<iframe src="https://www.facebook.com/v2.3/plugins/video.php?allowfullscreen=true&autoplay=true&href=''' +
          link +
          '''"></iframe>''';

  print(html);
  return html;
}
