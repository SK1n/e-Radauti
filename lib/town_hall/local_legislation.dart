import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/town_hall/legislation_list_state.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalLegislation extends StatefulWidget {
  @override
  State<LocalLegislation> createState() => _LocalLegislationState();
}

class _LocalLegislationState extends State<LocalLegislation> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    Provider.of<LegislationListData>(context, listen: false).getData();
    Provider.of<LegislationListData>(context, listen: false)
        .clearQueryInitState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    LegislationListData legislationListData =
        Provider.of<LegislationListData>(context);
    TextEditingController searchQueryController = new TextEditingController();
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
              Container(
                height: 50,
                child: ListTile(
                  trailing: legislationListData.query.isEmpty
                      ? InkWell(
                          child: Icon(Icons.search),
                          onTap: () {
                            legislationListData
                                .removeElements(searchQueryController.text);
                            searchQueryController.text =
                                legislationListData.query;
                          })
                      : InkWell(
                          child: Icon(Feather.x_circle),
                          onTap: () {
                            legislationListData.clearQuery();
                            legislationListData.clearList();
                            legislationListData.getData();
                          },
                        ),
                  title: TextFormField(
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (_) {
                      legislationListData
                          .removeElements(searchQueryController.text);
                      searchQueryController.text = legislationListData.query;
                      debugPrint('submitted');
                    },
                    decoration: InputDecoration(hintText: 'Cauta...'),
                    controller: searchQueryController,
                    onChanged: (query) {},
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  child: list(legislationListData)),
            ],
          )),
    );
  }
}

ListView list(LegislationListData data) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int item) {
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(data.list[item].date.toString()),
            ),
            Text(
              data.list[item].title,
              textAlign: TextAlign.start,
            ),
            TextButton(
              onPressed: () async {
                debugPrint('${data.list[item].url}');
                await launch(data.list[item].url, forceSafariVC: false);
              },
              child: Text('Deschideti link-ul'),
            )
          ],
        ),
      );
    },
    itemCount: data.list.length,
  );
}
