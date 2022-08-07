import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/get_data_from_firebase_controller.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/utils/futuristic.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalLegislation extends StatefulWidget {
  @override
  State<LocalLegislation> createState() => _LocalLegislationState();
}

class _LocalLegislationState extends State<LocalLegislation> {
  @override
  void initState() {
    super.initState();
    // getData();
  }

  void getData() {
    //Provider.of<LegislationListData>(context, listen: false).getData();
    //Provider.of<LegislationListData>(context, listen: false)
    // .clearQueryInitState();
  }
  final GetDataFromFirebaseController _getDataFromFirebaseController =
      Get.find();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    //LegislationListData legislationListData =
    //Provider.of<LegislationListData>(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              AppBarUiSliver(
                content: 'Hotărâri de Consiliu Local',
                leading: Icons.location_city,
                scaffoldKey: _scaffoldKey,
              )
            ];
          },
          body: Stack(
            children: [
              Futuristic(
                futureBuilder: () => _getDataFromFirebaseController
                    .getDataFromFirebase('Legislation'),
                busyBuilder: (_) {
                  if (!EasyLoading.isShow) {
                    EasyLoading.show();
                  }
                  return Container();
                },
                errorBuilder: (_, error, retry) {
                  EasyLoading.showError("Eroare");
                  return TextButton(
                      onPressed: () => retry, child: Text('Incearca din nou!'));
                },
                dataBuilder: (_, snap) {
                  if (EasyLoading.isShow) {
                    EasyLoading.dismiss();
                  }
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int item) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Icon(Icons.calendar_today),
                              title: Text(
                                  snap.data['2020'][item]['an'].toString()),
                            ),
                            Text(
                              snap.data['2020'][item]['titlu'].toString(),
                              textAlign: TextAlign.start,
                            ),
                            TextButton(
                              onPressed: () async {
                                await launch(snap.data['2020'][item]['link'],
                                    forceSafariVC: false);
                              },
                              child: Text('Deschideti link-ul'),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: _getDataFromFirebaseController
                        .getLength(snap.data['2020']),
                  );
                },
              ),
            ],
          )),
    );
  }
}
