import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:expandable/expandable.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class LocalLegislation extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel().loadAppBar(
          context, 'Hotărâri\nLocale', Icons.location_city, _scaffoldKey),
      drawer: NavDrawer(),
       body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  loadJsonList() async{
    Map<String, dynamic> fd;
    http.Response r = await http.get('https://e-radauti-80139.firebaseio.com/-HotarariArhiva.json');
    fd = json.decode(r.body);
    final List<dynamic> children = List<dynamic>();
    final List<dynamic> children2 = [];
    fd.forEach(
            (key, value) {
              List<dynamic> varList = value;
              varList.forEach(
                      (element) {
                        if(element != null)
                          children.add(element);
                      }
              );
            }
    );
    for(int i = children.length - 1; i >= 0; i--){
      children2.add(children[i]);
    };
    return children2;
  }
  loadItems() async{
    List<dynamic> v = await loadJsonList();
    setState(() {
      duplicateItems = v;
      items.addAll(duplicateItems);
    });
  }
  Widget fw(List lGive){
    List<Widget> lWidgetLink = List<Widget>();
    List<Widget> lWidgetCard = [];
    Widget rWidget;
    var vIndex = 1;
    var vAn = 0;
    var test = 0;
    var contor = 0;
    for(final item in lGive)
      if((item['an'] == vAn)&&(test == 0)){
        vIndex += 1;
        contor += 1;
        lWidgetLink.add(
            Container(
              child: InkWell(
                child: Text(
                  vIndex.toString()+'. '+item['titlu'],
                  style: TextStyle(
                      color: Colors.indigo
                  ),
                ),
                onTap: () => {UrlLauncher.launch(item['link'])},
              ),
            )
        );
        if(contor == (lGive.length - 1)) test = 1;
      }else if((item['an'] != vAn)||((item['an'] == vAn)&&(test == 1))){
        if(lGive.length == 1){
          lWidgetLink.add(
              Container(
                child: InkWell(
                  child: Text(
                    '1. ' + item['titlu'],
                    style: TextStyle(
                      color: Colors.indigo
                    ),
                  ),
                  onTap: ()=>{UrlLauncher.launch(item['link'])},
                ),
              ),
          );
          lWidgetCard.add(
              ExpandableNotifier(
                child: Card(
                  child: ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(),
                      header: Container(child: Text(''+item['an'].toString()),),
                      expanded: Container(child: lWidgetLink[0],),
                      collapsed: Container(),
                      builder: (_,colapsed,expanded){
                        return Expandable(
                          expanded: expanded,
                          theme: ExpandableThemeData(),
                        );
                      },
                    ),
                  ),
                ),
              )
          );
        }else{
          if(contor == (lGive.length - 1) ){
            lWidgetLink.add(
                Container(
                  child: InkWell(
                    child: Text(
                      (vIndex).toString() +'. ' + item['titlu'],
                      style: TextStyle(
                          color: Colors.indigo
                      ),
                    ),
                    onTap: ()=>{UrlLauncher.launch(item['link'])},
                  ),
                )
            );
          };
          if(vAn != 0){
            lWidgetCard.add(
              ExpandableNotifier(
                child: Card(
                  child: ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(),
                      header: Container(child: Text(''+vAn.toString()),),
                      expanded: Column(children: <Widget>[for(final item in lWidgetLink)item,],),
                      collapsed: Container(),
                      builder: (_,colapsed,expanded){
                        return Expandable(
                          expanded: expanded,
                          theme: ExpandableThemeData(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          };
          vAn=item['an'];
          vIndex = 1;
          lWidgetLink.clear();
          lWidgetLink.add(
              Container(
                child: InkWell(
                  child: Text(
                    vIndex.toString()+'. '+item['titlu'],
                    style: TextStyle(color: Colors.indigo),
                  ),
                  onTap: ()=>{UrlLauncher.launch(item['link'])},
                ),
              )
          );
          if(contor<(lGive.length - 1)){
            contor += 1;
          }else{
            contor = 0;
          };
        };
      };
      rWidget = Column(
        children: <Widget>[
          for(final item in lWidgetCard)item,
        ],
      );
      return rWidget;
  }
  TextEditingController editingController = TextEditingController();
  List<dynamic> duplicateItems = [];
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }
  void filterSearchResults(String query) {
    List<dynamic> dummySearchList = List<dynamic>();
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<dynamic> dummyListData = List<dynamic>();
      dummySearchList.forEach((item) {
        if(item['titlu'].contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Caută",
                  hintText: "Caută",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: fw(items),
              ),
            ),
          ),
        ],
      ),
    );
  }
}