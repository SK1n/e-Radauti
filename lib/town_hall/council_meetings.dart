import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/town_hall/models/council_meetings.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:video_player/video_player.dart';

class CouncilMeetings extends StatefulWidget {
  CouncilMeetings({Key key}) : super(key: key);

  @override
  _CouncilMeetingsState createState() => _CouncilMeetingsState();
}

class _CouncilMeetingsState extends State<CouncilMeetings> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    FetchCouncilMeetingsData data =
        Provider.of<FetchCouncilMeetingsData>(context);
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
            body: FutureBuilder(
              future: data.getCouncilMeetingsFromFirebase(),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int item) {
                      return CouncilListItemWidget(
                        data: snap.data[item],
                        isFirst: item == 0 ? true : false,
                      );
                    },
                    itemCount: data.getLength(),
                  );
                } else {
                  return LoadingScreen();
                }
              },
            )));
  }
}

class CouncilListItemWidget extends StatefulWidget {
  final CouncilMeetingsModel data;
  final bool isFirst;
  const CouncilListItemWidget({
    Key key,
    this.data,
    this.isFirst,
  }) : super(key: key);

  @override
  State<CouncilListItemWidget> createState() => _CouncilListItemWidgetState();
}

class _CouncilListItemWidgetState extends State<CouncilListItemWidget> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('${widget.data.url}.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Expandable(
        expanded: Card(
          child: Column(
            children: [
              videoWidget(widget.data.url),
              TextButton(
                onPressed: () async {
                  await UrlLauncher.launch(widget.data.theagend,
                      forceSafariVC: false);
                },
                child: Text("Deschideti ordinea de zi: ${widget.data.date}"),
              ),
            ],
          ),
        ),
        collapsed: Card(child: Text('Ordinea: ${widget.data.date}')),
      ),
      initialExpanded: widget.isFirst,
    );
  }

  HtmlWidget videoWidget(String url) {
    return HtmlWidget(
      '''
           <iframe width="200"
            src="https://www.facebook.com/v2.3/plugins/video.php? 
            allowfullscreen=false&autoplay=true&href=$url" </iframe>
     ''',
      webView: true,
    );
  }
}
