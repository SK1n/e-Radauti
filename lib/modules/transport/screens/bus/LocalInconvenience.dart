import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:http/http.dart' as http;
import 'package:expandable/expandable.dart';
import 'package:url_launcher/url_launcher_string.dart';

///
/// NOT WRITTEN BY SK1N
///  I'M NOT SURE HOW IT WORK, GONNA LEAVE IT LIKE THAT. IT'S BROKEN ALREADY
///   MAYBE IN THE FUTURE I'LL REWORK THIS SCREEN
///

Future<List> fetchBusList(String? route) async {
  Map<String, dynamic> fd;
  http.Response r = await http.get(Uri.parse(
      'https://e-radauti-80139.firebaseio.com/Transport_Autobuz.json'));
  fd = json.decode(r.body);
  final List<dynamic> response = [];

  fd.forEach((key, value) {
    if (route == key) {
      Map<String, dynamic> mapValue = {};
      mapValue = value;
      mapValue.forEach((key, value) {
        response.add(value);
      });
    }
  });
  return response;
}

//2
Widget fWidget(child, BuildContext context) {
  Widget rWidget;
  rWidget = Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            width: 50.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 55.0,
                  child: TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      width: 8.0,
                      color: Colors.white,
                      iconStyle: IconStyle(
                        iconData: Icons.trip_origin_rounded,
                        fontSize: 15.0,
                        color: Color(0xFFFB6340),
                      ),
                    ),
                    alignment: TimelineAlign.manual,
                    lineXY: 0.3,
                    isFirst: true,
                    beforeLineStyle: LineStyle(
                      color: Color(0xFFFB6340),
                    ),
                  ),
                ),
                Container(
                  height: 55.0,
                  child: TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      width: 8.0,
                      color: Colors.white,
                      iconStyle: IconStyle(
                        iconData: Icons.trip_origin_rounded,
                        color: Color(0xFF38A49C),
                        fontSize: 15.0,
                      ),
                    ),
                    alignment: TimelineAlign.manual,
                    lineXY: 0.3,
                    isLast: true,
                    beforeLineStyle: LineStyle(
                      color: Color(0xFF38A49C),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 90.0,
                child: Text(
                  child['statie plecare'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  //style: TextStyle(fontSize: ,),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 90.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Card(
                      color: Color(0xFFFB6340),
                      child: Container(
                        height: 28.0,
                        child: Container(
                          height: 22.0,
                          // ignore: deprecated_member_use
                          child: TextButton(
                            onPressed: null,
                            child: Text(
                              child['durata'],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 90.0,
                child: Text(
                  child['statie sosire'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  //style: TextStyle(fontSize: ,),
                ),
              ),
            ],
          ),
        ],
      ),
      Container(
        width: MediaQuery.of(context).size.width - 35.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              child: Container(
                height: 24.0,
                // ignore: deprecated_member_use
                child: TextButton(
                  onPressed: child['telefon'] == null
                      ? null
                      : () {
                          launchUrlString('tel://${child['telefon']}');
                        },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.phone),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        child['telefon'] == null ? '-' : child['telefon'],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Color(0xFFFB6340),
              child: Container(
                height: 25.0,
                child: Container(
                  height: 24.0,
                  // ignore: deprecated_member_use
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Zile de circulație: ' + child['zile de circulatie'],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 5.0,
      ),
      Container(
        width: MediaQuery.of(context).size.width - 45.0,
        child: Text(
            'Tip mijloc de transport - traseu: ' + child['tip auto - traseu']),
      ),
      SizedBox(
        height: 5.0,
      ),
      (child['dotari'] == null || child['dotari'] == '-')
          ? Container()
          : Column(
              children: <Widget>[
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 45.0,
                  child: Text(
                    'Dotări: ' + child['dotari'],
                    //overflow: TextOverflow.ellipsis,
                    //maxLines: 5,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
      Container(
        width: MediaQuery.of(context).size.width - 35.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Color(0xFFFB6340),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Transportator",
                          style: TextStyle(
                            color: Colors.blue.shade100,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 90.0,
                          child: Center(
                            child: Text(
                              child['companie'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  return rWidget;
}

//3
Widget expandableWidget(child, childString, childWidget, BuildContext bC) {
  Widget result;
  result = Column(
    children: <Widget>[
      ExpandableNotifier(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          width: MediaQuery.of(bC).size.width,
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 1,
            child: Container(
              child: ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: ExpandableThemeData(),
                  header: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '$childString',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            '${child['ora plecare']}',
                            style: TextStyle(color: Color(0xFF38A49C)),
                          ),
                          Icon(
                            Icons.directions_bus,
                            color: Color(0x55FB6340),
                          ),
                          Text(
                            '${child['ora sosire']}',
                            style: TextStyle(color: Color(0xFF38A49C)),
                          )
                        ],
                      ),
                      //SizedBox(height: 5.0,),
                    ],
                  ),
                  expanded: Container(
                    child: childWidget,
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Expandable(
                        expanded: expanded,
                        theme: ExpandableThemeData(),
                        collapsed: Container(),
                      ),
                    );
                  },
                  collapsed: Container(),
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10.0,
      )
    ],
  );
  return result;
}

//2
class LocalInconvenience extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String? giveString;
  LocalInconvenience({
    Key? key,
    this.giveString,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
          child: AppBarUi(
            scaffoldKey: _scaffoldKey,
            leading: Icons.directions_bus,
            content: 'Autobuz',
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 50)),
      drawer: NavDrawer(),
      body: ExpandableTheme(
        data: ExpandableThemeData(
          iconColor: Color(0xAA38A49C),
          useInkWell: true,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10.0),
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width - 10.0,
                child: Image.asset(
                  "assets/images/bus/autocar.jpg",
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              //2
              Container(
                child: FutureBuilder(
                  future: fetchBusList(giveString),
                  builder: (context, AsyncSnapshot? snapshot) {
                    if (snapshot!.hasData) {
                      return Column(
                        children: <Widget>[
                          for (final item in snapshot.data)
                            expandableWidget(item, giveString,
                                fWidget(item, context), context),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Center(
                          child: Text('Eroare de încarcare'),
                        ),
                      );
                    }
                    return Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF38A49C)),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
