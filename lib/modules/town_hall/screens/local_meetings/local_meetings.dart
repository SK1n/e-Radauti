import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:expandable/expandable.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocalMeetings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    GetDataFromFirebaseController _getDataFromFirebaseController =
        Get.find<GetDataFromFirebaseController>();
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
            body: Futuristic(
              futureBuilder: () => _getDataFromFirebaseController
                  .getDataFromFirebase('CouncilMeetings'),
              query: 'meetings',
              dataBuilder: (BuildContext context, AsyncSnapshot snap) {
                EasyLoading.dismiss();
                return ListView.builder(
                  itemBuilder: (BuildContext context, int item) {
                    return CouncilListItemWidget(
                      data: snap.data['meetings'][item],
                      isFirst: item == 0 ? true : false,
                    );
                  },
                  itemCount: _getDataFromFirebaseController
                      .getLength(snap.data['meetings']),
                );
              },
            )));
  }
}

class CouncilListItemWidget extends StatefulWidget {
  final dynamic data;
  final bool isFirst;
  const CouncilListItemWidget({
    Key? key,
    required this.data,
    required this.isFirst,
  }) : super(key: key);

  @override
  State<CouncilListItemWidget> createState() => _CouncilListItemWidgetState();
}

class _CouncilListItemWidgetState extends State<CouncilListItemWidget> {
  ExpandableController expandableController = new ExpandableController();
  @override
  void dispose() {
    super.dispose();
    expandableController.dispose();
  }

  @override
  void initState() {
    expandableController.value = widget.isFirst;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: expandableController,
      child: Expandable(
        expanded: InkWell(
          onTap: () {
            setState(() {
              expandableController.value = true;
              expandableController.toggle();
              debugPrint(widget.data.toString());
            });
          },
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Ordinea: ${widget.data['date']}'),
                  trailing: expandableController.expanded
                      ? Icon(Icons.arrow_upward)
                      : Icon(Icons.arrow_downward),
                ),
                videoWidget(widget.data['URL']),
                TextButton(
                  onPressed: () async {
                    await launchUrlString(widget.data.theagend);
                  },
                  child: Text('Deschideti ordinea de zi'),
                ),
              ],
            ),
          ),
        ),
        collapsed: InkWell(
          onTap: () {
            setState(() {
              expandableController.value = false;
              expandableController.toggle();
            });
          },
          child: Card(
            child: ListTile(
                title: Text('Ordinea: ${widget.data['date']}'),
                trailing: Icon(expandableController.expanded
                    ? Icons.arrow_upward
                    : Icons.arrow_downward)),
          ),
        ),
      ),
    );
  }

  HtmlWidget videoWidget(String url) {
    return HtmlWidget(
      '''
           <iframe width="200"
            src="https://www.facebook.com/v2.3/plugins/video.php?
            allowfullscreen=false&autoplay=true&href=$url" </iframe>
     ''',
      // ignore: deprecated_member_use
      webViewJs: true,
      factoryBuilder: () => MyWidgetFactory(),
    );
  }
}

class MyWidgetFactory extends WidgetFactory {
  // optional: override getter to configure how WebViews are built
  bool get webViewMediaPlaybackAlwaysAllow => true;
  String? get webViewUserAgent => 'My app';
  bool get webView => true;
}
