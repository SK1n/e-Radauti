import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:timeline_tile/timeline_tile.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:expandable/expandable.dart';

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

//2
class BusList extends StatelessWidget with UrlLauncher {
  final String? giveString;
  const BusList({
    super.key,
    this.giveString,
  });

  Widget fWidget(child, BuildContext context) {
    Widget rWidget;
    rWidget = Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 50.0,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 55.0,
                    child: TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        width: 8.0,
                        color: Colors.white,
                        iconStyle: IconStyle(
                          iconData: Icons.trip_origin_rounded,
                          fontSize: 15.0,
                          color: const Color(0xFFFB6340),
                        ),
                      ),
                      alignment: TimelineAlign.manual,
                      lineXY: 0.3,
                      isFirst: true,
                      beforeLineStyle: const LineStyle(
                        color: Color(0xFFFB6340),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55.0,
                    child: TimelineTile(
                      indicatorStyle: IndicatorStyle(
                        width: 8.0,
                        color: Colors.white,
                        iconStyle: IconStyle(
                          iconData: Icons.trip_origin_rounded,
                          color: const Color(0xFF38A49C),
                          fontSize: 15.0,
                        ),
                      ),
                      alignment: TimelineAlign.manual,
                      lineXY: 0.3,
                      isLast: true,
                      beforeLineStyle: const LineStyle(
                        color: Color(0xFF38A49C),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width - 90.0,
                  child: Text(
                    child['statie plecare'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    //style: TextStyle(fontSize: ,),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 90.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FilledButton(
                        onPressed: null,
                        child: Text(
                          child['durata'],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
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
        SizedBox(
          width: MediaQuery.of(context).size.width - 35.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FilledButton(
                onPressed: child['telefon'] == null
                    ? null
                    : () async {
                        await launchUrl('tel://${child['telefon']}');
                      },
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.phone),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      child['telefon'] ?? '-',
                    ),
                  ],
                ),
              ),
              FilledButton(
                onPressed: null,
                child: Text(
                  'Zile de circulație\n ${child['zile de circulatie']}',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 45.0,
          child: Text(
            'Tip mijloc de transport - traseu: ${child['tip auto - traseu']}',
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        (child['dotari'] == null || child['dotari'] == '-')
            ? Container()
            : Column(
                children: <Widget>[
                  const SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 45.0,
                    child: Text(
                      'Dotări: ${child['dotari']}',
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 35.0,
          child: Text(
            "${child['companie']}",
            textAlign: TextAlign.center,
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            width: MediaQuery.of(bC).size.width,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 1,
              child: ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(),
                  header: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '$childString',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            '${child['ora plecare']}',
                          ),
                          const Icon(
                            Icons.directions_bus,
                          ),
                          Text(
                            '${child['ora sosire']}',
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: Expandable(
                        expanded: expanded,
                        theme: const ExpandableThemeData(),
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
        const SizedBox(
          height: 10.0,
        )
      ],
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(
            leading: Icons.directions_bus,
            content: 'Autobuz',
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width - 10.0,
                    child: Image.asset(
                      "assets/images/bus/autocar.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  FutureBuilder(
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
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: const Center(
                            child: Text('Eroare de încarcare'),
                          ),
                        );
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF38A49C)),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
