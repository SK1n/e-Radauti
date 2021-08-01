import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/transport/LocalInconvenience.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:http/http.dart' as http;
import '../widgets/src/appBarModel.dart';

Future<List> fetchRoutes() async{
  Map<String, dynamic> fd;
  http.Response r = await http.get('https://e-radauti-80139.firebaseio.com/Transport_Autobuz.json');
  fd = json.decode(r.body);
  final List<dynamic> response = [];
  fd.forEach((key, value) {
    response.add(key);
  });
  return response;
}

class Bus extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel().loadAppBar(context, "Autobuz",
          Icons.directions_bus, _scaffoldKey),
      drawer: NavDrawer(),
      body: BusMain(),
    );
  }
}

class BusMain extends StatefulWidget {
  BusMain({
    Key key,
  }) : super(key: key);
  @override
  _BusMainState createState() => new _BusMainState();
}

class _BusMainState extends State<BusMain> {

  loadItems() async {
    List<dynamic> v = await fetchRoutes();
    setState(() {
      duplicateItems = v;
      items.addAll(duplicateItems);
    });
  }
  loadDropdownItem() async{
    List<dynamic> v = await fetchRoutes();
    setState(() {
      getItems = buildListStringItemes(v);
      _dropdownMenuItems = buildDropdownMenuItems(getItems);
    });
  }


  //2
  Widget fw(List lGive) {
    List<Widget> lWidgetCard = [];
    Widget rWidget;

    //2
    for (final item in lGive) {
      lWidgetCard.add(
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocalInconvenience(giveString: item,))
                  );
                },
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(Icons.directions_bus, color: Color(0xFF979797),),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 5.0, top: 5.0,),
                          width: MediaQuery.of(context).size.width - 100.0,
                          child: Center(
                            child: Text(
                              '' + item,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(fontSize: 17.0,),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Color(0xFF979797),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
            ],
          )
      );
    }

    rWidget = Column(
      children: <Widget>[
        for (final item in lWidgetCard) item,
      ],
    );
    return rWidget;
  }

  //2
  TextEditingController editingControllerStart = TextEditingController();
  TextEditingController editingControllerEnd = TextEditingController();
  String _chosenValue;
  String _chosenValue2;
  //3
  List<DropdownMenuItem<String>> _dropdownMenuItems;
  List<DropdownMenuItem<String>> buildDropdownMenuItems(List listItems) {
    List<DropdownMenuItem<String>> items = List();
    for(String listItem in listItems){
      items.add(
        DropdownMenuItem<String>(
          child: Container(
            width: MediaQuery.of(context).size.width/2 - 30.0,
            child: Text(listItem, overflow: TextOverflow.ellipsis, maxLines: 2,),
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }
  //4
  var regExp = RegExp(r' - .*');
  var regExp2 = RegExp(r'.* - ');
  List<String> getItems;
  List<String> buildListStringItemes(List listItems) {
    List<String> items = List();
    items = ['- Selectează -'];
    String value;
    String value2;
    bool verify;
    for(String listItem in listItems){
      value = '' + listItem.replaceAll(regExp, '');
      value2 = '' + listItem.replaceAll(regExp2,'');
      verify = false;
      for(String item in items){
        if(item == value){
          verify = true;
        }
      }
      if(!verify){
        items.add(value);
      }
      verify = false;
      for(String item in items){
        if(item == value2){
          verify = true;
        }
      }
      if(!verify){
        items.add(value2);
      }
    }

    return items;
  }

  List<dynamic> duplicateItems = [];
  List<dynamic> items = [];

  //2
  void filterSearchResults(String query1, String query2) {
    List<dynamic> dummySearchList = List<dynamic>();
    dummySearchList.addAll(duplicateItems);
    if (query1.isNotEmpty && query2.isNotEmpty) {
      List<dynamic> dummyListData = List<dynamic>();
      dummySearchList.forEach((item) {
        if (item.contains(query1 + ' - ' + query2) || (item.startsWith(query1) && item.contains(' - ' + query2))) {
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
  void initState() {
    super.initState();
    loadItems();
    loadDropdownItem();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30.0,),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('Plecare', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2 ,
                    //height: 20.0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        onChanged: (value) {
                          if(editingControllerEnd.text.isNotEmpty){
                            filterSearchResults(value, editingControllerEnd.text);
                          }
                          //filterSearchResults(value);
                        },
                        controller: editingControllerStart,
                        decoration: InputDecoration(
                            labelText: "Caută",
                            hintText: "Caută",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('Sosire', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2 ,
                    //height: 20.0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        onChanged: (value) {
                          if(editingControllerStart.text.isNotEmpty){
                            filterSearchResults(editingControllerStart.text, value);
                          }
                          //filterSearchResults(value);
                        },
                        controller: editingControllerEnd,
                        decoration: InputDecoration(
                            labelText: "Caută",
                            hintText: "Caută",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0,),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                    child: Text('Plecare', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2 - 20.0,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        border: Border.all()
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _chosenValue,
                        items: _dropdownMenuItems,
                        onChanged: (String value){
                          setState(() {
                            if(value != '- Selectează -'){
                              _chosenValue = value;
                              if(_chosenValue2 != null){
                                filterSearchResults(_chosenValue, _chosenValue2);
                              }
                            }else{
                              _chosenValue = null;
                              items.clear();
                              items.addAll(duplicateItems);
                              ;
                            }
                          });
                        },
                        hint: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('- Selectează -'),
                        ),
                        isExpanded: true,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                    child: Text('Sosire', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2 - 20.0,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        border: Border.all()
                    ),
                    child: ButtonTheme(
                      //alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _chosenValue2,
                        underline: SizedBox(height: 0.0,),
                        elevation: 2,
                        items: _dropdownMenuItems,
                        onChanged: (String value){
                          setState(() {
                            if(value != '- Selectează -'){
                              _chosenValue2 = value;
                              if(_chosenValue != null){
                                filterSearchResults(_chosenValue, _chosenValue2);
                              }
                            }else{
                              _chosenValue2 = null;
                              items.clear();
                              items.addAll(duplicateItems);
                            }

                          });
                        },
                        hint: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('- Selectează -'),
                        ),
                        isExpanded: true,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0,),
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