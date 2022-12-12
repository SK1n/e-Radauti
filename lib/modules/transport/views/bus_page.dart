import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/transport/views/bus_list.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

Future<List> fetchRoutes() async {
  Map<String, dynamic> fd;
  http.Response r = await http.get(Uri.parse(
      'https://e-radauti-80139.firebaseio.com/Transport_Autobuz.json'));
  fd = json.decode(r.body);
  final List<dynamic> response = [];
  fd.forEach((key, value) {
    response.add(key);
  });
  return response;
}

class BusPage extends StatelessWidget {
  const BusPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      endDrawer: NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            leading: Icons.directions_bus,
            content: 'Autobuzuri',
          ),
          SliverFillRemaining(child: BusMain())
        ],
      ),
    );
  }
}

class BusMain extends StatefulWidget {
  const BusMain({
    super.key,
  });
  @override
  BusMainState createState() => BusMainState();
}

class BusMainState extends State<BusMain> {
  loadItems() async {
    List<dynamic> v = await fetchRoutes();
    setState(() {
      duplicateItems = v;
      items.addAll(duplicateItems);
    });
  }

  loadDropdownItem() async {
    List<dynamic> v = await fetchRoutes();
    setState(() {
      getItems = buildListStringItemes(v);
      _dropdownMenuItems = buildDropdownMenuItems(getItems!);
    });
  }

  //2
  Widget fw(List lGive) {
    List<Widget> lWidgetCard = [];
    Widget rWidget;

    //2
    for (final item in lGive) {
      lWidgetCard.add(Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BusList(
                            giveString: item,
                          )));
            },
            child: Card(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 20.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: const Icon(
                        Icons.directions_bus,
                        color: Color(0xFF979797),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 5.0,
                        top: 5.0,
                      ),
                      width: MediaQuery.of(context).size.width - 100.0,
                      child: Center(
                        child: Text(
                          item,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: const Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF979797),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ));
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
  String? _chosenValue;
  String? _chosenValue2;
  //3
  List<DropdownMenuItem<String>>? _dropdownMenuItems;
  List<DropdownMenuItem<String>> buildDropdownMenuItems(List listItems) {
    // ignore: deprecated_member_use
    List<DropdownMenuItem<String>> items = [];
    for (String listItem in listItems) {
      items.add(
        DropdownMenuItem<String>(
          value: listItem,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 30.0,
            child: Text(
              listItem,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
      );
    }
    return items;
  }

  //4
  var regExp = RegExp(r' - .*');
  var regExp2 = RegExp(r'.* - ');
  List<String>? getItems;
  List<String> buildListStringItemes(List listItems) {
    // ignore: deprecated_member_use
    List<String> items = [];
    items = ['- Selectează -'];
    String value;
    String value2;
    bool verify;
    for (String listItem in listItems) {
      value = listItem.replaceAll(regExp, '');
      value2 = listItem.replaceAll(regExp2, '');
      verify = false;
      for (String item in items) {
        if (item == value) {
          verify = true;
        }
      }
      if (!verify) {
        items.add(value);
      }
      verify = false;
      for (String item in items) {
        if (item == value2) {
          verify = true;
        }
      }
      if (!verify) {
        items.add(value2);
      }
    }

    return items;
  }

  List<dynamic> duplicateItems = [];
  List<dynamic> items = [];

  //2
  void filterSearchResults(String query1, String query2) {
    // ignore: deprecated_member_use
    List<dynamic> dummySearchList = <dynamic>[];
    dummySearchList.addAll(duplicateItems);
    if (query1.isNotEmpty && query2.isNotEmpty) {
      // ignore: deprecated_member_use
      List<dynamic> dummyListData = <dynamic>[];
      for (var item in dummySearchList) {
        if (item.contains('$query1 - $query2') ||
            (item.startsWith(query1) && item.contains(' - $query2'))) {
          dummyListData.add(item);
        }
      }
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
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                  child: Text(
                    'departure'.tr,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20.0,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      border: Border.all()),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _chosenValue,
                      items: _dropdownMenuItems,
                      onChanged: (String? value) {
                        setState(() {
                          if (value != 'select'.tr) {
                            _chosenValue = value!;
                            if (_chosenValue2!.isEmpty) {
                              filterSearchResults(
                                  _chosenValue!, _chosenValue2!);
                            }
                          } else {
                            _chosenValue = '';
                            items.clear();
                            items.addAll(duplicateItems);
                          }
                        });
                      },
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text('select'.tr),
                      ),
                      isExpanded: true,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                  child: Text(
                    'arrival'.tr,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20.0,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      border: Border.all()),
                  child: ButtonTheme(
                    //alignedDropdown: true,
                    child: DropdownButton<String>(
                      value: _chosenValue2,
                      underline: const SizedBox(
                        height: 0.0,
                      ),
                      elevation: 2,
                      items: _dropdownMenuItems,
                      onChanged: (String? value) {
                        setState(() {
                          if (value != '- Selectează -') {
                            _chosenValue2 = value!;
                            if (_chosenValue!.isEmpty) {
                              filterSearchResults(
                                  _chosenValue!, _chosenValue2!);
                            }
                          } else {
                            _chosenValue2 = '';
                            items.clear();
                            items.addAll(duplicateItems);
                          }
                        });
                      },
                      hint: const Padding(
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
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: Container(
            child: fw(items),
          ),
        ),
      ],
    );
  }
}
