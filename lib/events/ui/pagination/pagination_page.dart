import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_paginator/flutter_paginator.dart';
import 'package:flutter_paginator/enums.dart';

//import 'package:flutterapperadauti/TownHall/town_hall_main.dart';

void main() => runApp(MyApp3());

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Paginator',
      //home: HomePage(),
      home: HomePage2(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  GlobalKey<PaginatorState> paginatorGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Paginator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.format_list_bulleted),
            onPressed: () {
              paginatorGlobalKey.currentState
                  .changeState(listType: ListType.LIST_VIEW);
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              paginatorGlobalKey.currentState.changeState(
                listType: ListType.GRID_VIEW,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.library_books),
            onPressed: () {
              paginatorGlobalKey.currentState
                  .changeState(listType: ListType.PAGE_VIEW);
            },
          ),
        ],
      ),
      body: Paginator.listView(
        key: paginatorGlobalKey,
        pageLoadFuture: sendCountriesDataRequest,
        pageItemsGetter: listItemsGetter,
        listItemBuilder: listItemBuilder,
        loadingWidgetBuilder: loadingWidgetMaker,
        errorWidgetBuilder: errorWidgetMaker,
        emptyListWidgetBuilder: emptyListWidgetMaker,
        totalItemsGetter: totalPagesGetter,
        pageErrorChecker: pageErrorChecker,
        scrollPhysics: BouncingScrollPhysics(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          paginatorGlobalKey.currentState.changeState(
              pageLoadFuture: sendCountriesDataRequest, resetState: true);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Future<CountriesData> sendCountriesDataRequest(int page) async {
    try {
      String url = Uri.encodeFull(
          'http://api.worldbank.org/v2/country?page=$page&format=json');
      http.Response response = await http.get(url);
      return CountriesData.fromResponse(response);
    } catch (e) {
      if (e is IOException) {
        return CountriesData.withError(
            'Please check your internet connection.');
      } else {
        print(e.toString());
        return CountriesData.withError('Something went wrong.');
      }
    }
  }

  List<dynamic> listItemsGetter(CountriesData countriesData) {
    List<String> list = [];
    countriesData.countries.forEach((value) {
      list.add(value['name']);
    });
    return list;
  }

  Widget listItemBuilder(value, int index) {
    return ListTile(
      leading: Text(index.toString()),
      title: Text(value),
    );
  }

  Widget loadingWidgetMaker() {
    return Container(
      alignment: Alignment.center,
      height: 160.0,
      child: CircularProgressIndicator(),
    );
  }

  Widget errorWidgetMaker(CountriesData countriesData, retryListener) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(countriesData.errorMessage),
        ),
        FlatButton(
          onPressed: retryListener,
          child: Text('Retry'),
        )
      ],
    );
  }

  Widget emptyListWidgetMaker(CountriesData countriesData) {
    return Center(
      child: Text('No countries in the list'),
    );
  }

  int totalPagesGetter(CountriesData countriesData) {
    return countriesData.total;
  }

  bool pageErrorChecker(CountriesData countriesData) {
    return countriesData.statusCode != 200;
  }
}

class CountriesData {
  List<dynamic> countries;
  int statusCode;
  String errorMessage;
  int total;
  int nItems;

  CountriesData.fromResponse(http.Response response) {
    this.statusCode = response.statusCode;
    List jsonData = json.decode(response.body);
    countries = jsonData[1];
    total = jsonData[0]['total'];
    nItems = countries.length;
  }

  CountriesData.withError(String errorMessage) {
    this.errorMessage = errorMessage;
  }
}


class HomePage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState2();
  }
}

class HomeState2 extends State<HomePage2> {
  GlobalKey<PaginatorState> paginatorGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        //title: Text('Flutter Paginator'),
        title: Text('Local Events Paginator'),
        /*actions: <Widget>[
          IconButton(
            icon: Icon(Icons.format_list_bulleted),
            onPressed: () {
              paginatorGlobalKey.currentState
                  .changeState(listType: ListType.LIST_VIEW);
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              paginatorGlobalKey.currentState.changeState(
                listType: ListType.GRID_VIEW,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.library_books),
            onPressed: () {
              paginatorGlobalKey.currentState
                  .changeState(listType: ListType.PAGE_VIEW);
            },
          ),
        ],*/
      ),*/
      body: Paginator.listView(
        key: paginatorGlobalKey,
        pageLoadFuture: sendCountriesDataRequest,
        pageItemsGetter: listItemsGetter,
        listItemBuilder: listItemBuilder,
        loadingWidgetBuilder: loadingWidgetMaker,
        errorWidgetBuilder: errorWidgetMaker,
        emptyListWidgetBuilder: emptyListWidgetMaker,
        totalItemsGetter: totalPagesGetter,
        pageErrorChecker: pageErrorChecker,
        scrollPhysics: BouncingScrollPhysics(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          paginatorGlobalKey.currentState.changeState(
              pageLoadFuture: sendCountriesDataRequest, resetState: true);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  /*Future<CountriesData2> sendCountriesDataRequest(int page) async {
    try {
      String url = Uri.encodeFull(
          'http://api.worldbank.org/v2/country?page=$page&format=json');
      http.Response response = await http.get(url);
      return CountriesData2.fromResponse(response);
    } catch (e) {
      if (e is IOException) {
        return CountriesData2.withError(
            'Please check your internet connection.');
      } else {
        print(e.toString());
        return CountriesData2.withError('Something went wrong.');
      }
    }
  }*/

  Future<CountriesData2> sendCountriesDataRequest(int nr) async {
    try {
      String url = Uri.encodeFull(
          //'http://api.worldbank.org/v2/country?page=$nr&format=json'
          'https://data-a2c86.firebaseio.com/items.json'
      );
      http.Response response = await http.get(url);
      return CountriesData2.fromResponse(response, nr);
    } catch (e) {
      if (e is IOException) {
        return CountriesData2.withError(
            'Please check your internet connection.');
      } else {
        print(e.toString());
        return CountriesData2.withError('Something went wrong.');
      }
    }
  }

  /*List<dynamic> listItemsGetter(CountriesData2 countriesData) {
    //List<String> list = [];
    List list = [];
    /*countriesData.countries.forEach((value) {
      //list.add(value['name']);
      list.add(value['region']['value']);
    });*/
    /*countriesData.countries.forEach((index) {
      //list.add(value['name']);
      list.add(index['region']['value']);
    });*/
    /*countriesData.events.forEach((index) {
      //list.add(value['name']);
      //list.add(index['title']);
      list.add(index);
    });*/
    list.add(countriesData.events);
    return list;
  }*/

  List<dynamic> listItemsGetter(CountriesData2 countriesData) {
    //List<String> list = [];
    //List list = [];
    Map<String, dynamic> list = {};
    List list2 = [];
    /*countriesData.countries.forEach((value) {
      //list.add(value['name']);
      list.add(value['region']['value']);
    });*/
    /*countriesData.countries.forEach((index) {
      //list.add(value['name']);
      list.add(index['region']['value']);
    });*/
    /*countriesData.events.forEach((index) {
      //list.add(value['name']);
      //list.add(index['title']);
      list.add(index);
    });*/
    //list.add(countriesData.events);
    list.addAll(countriesData.events);
    list2.add(list);
    //return list;
    return list2;
  }


  /*Widget listItemBuilder(value, int index) {
    return ListTile(
      leading: Text(index.toString()),
      title: Text(value),
    );
  }*/

  Widget listItemBuilder(value, int index) {
    /*return ListTile(
      leading: Text(index.toString()),
      title: Text(value),
    );*/

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Padding(
        //padding: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(5),//const EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  //data
                  children: <Widget>[
                    Text(
                      value['data'].toString() + '\n' + value['luna'],//'27\nAPR',//'data',//event.duration.toUpperCase(),
                      textAlign: TextAlign.center,//TextAlign.right,
                      /*style: eventLocationTextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),*/
                      style: TextStyle(
                        fontSize: 18,//40,//13 //16
                        color: Colors.grey[600],//[300]
                      ),
                    ),
                  ],
                ),

                Text(
                  '----------',//'ora',//event.duration.toUpperCase(),
                  textAlign: TextAlign.center,//TextAlign.right,
                  /*style: eventLocationTextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),*/
                  style: TextStyle(
                    fontSize: 18,//40,//16
                    color: Colors.grey[600],//[300]
                  ),
                ),

                /*const DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: const Text('Some text...'),
                    ),*/
                 DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.grey),//blue
                  child: Text(
                    value['ora'].toString() + ':' + value['minutele'].toString(),//'13:09',//'ora',//event.duration.toUpperCase(),
                    textAlign: TextAlign.center,//TextAlign.right,
                    /*style: eventLocationTextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),*/
                    style: TextStyle(
                      fontSize: 18,//40,//13 //16
                      //color: Colors.blueGrey,//[300]
                    ),
                  ),//Text('Some text...'),
                ),

                /*Row(
                  //ora
                  children: <Widget>[

                    Text(
                      '13:09',//'ora',//event.duration.toUpperCase(),
                      textAlign: TextAlign.center,//TextAlign.right,
                      /*style: eventLocationTextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),*/
                      style: TextStyle(
                        fontSize: 13,//40,
                        color: Colors.grey[600],//[300]
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          //foto
                          children:<Widget>[
                            /*Image.network(
                      event.imagePath,
                      height: 120,//150,
                      fit: BoxFit.fitHeight,//BoxFit.fitWidth,
                      width: 100,//150,//50,
                    ),*/
                            /*ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30),),
                      child: Image.network(
                        event.imagePath,
                        height: 120,//100,//150,
                        fit: BoxFit.fitHeight,//BoxFit.fitWidth,
                        width: 110,//150,//50,
                      ),//Image.asset(event.imagePath, height: 150, fit: BoxFit.fitWidth,),
                    ),*/
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:5, right:5), //const EdgeInsets.all(5)
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10),),
                            child: Image.network(
                              //event.imagePath,
                              value['url'],
                              height: 150,//120,//150,
                              fit: BoxFit.fitHeight,//BoxFit.fitWidth,
                              width: 100,//150,//50,
                            ),//Image.asset(event.imagePath, height: 150, fit: BoxFit.fitWidth,),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,//MainAxisAlignment.end,//MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          //titlu
                          children:<Widget>[
                            Text(
                              //event.title,
                              value['title'],
                              textAlign: TextAlign.left,//TextAlign.center,//TextAlign.right,
                              //style: eventTitleTextStyle,
                              /*style: TextStyle(
                        fontSize: 40,
                        color: Colors.grey[300],
                      ),*/
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.orange[300],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          //categoria
                          children:<Widget>[
                            //Icon(Icons.location_on),
                            Icon(Icons.category),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'categoria ' + value['subtitle'],//event.punchLine1,//event.title,
                              textAlign: TextAlign.left,//TextAlign.center,//TextAlign.right,
                              //style: eventTitleTextStyle,
                              style: TextStyle(
                                fontSize: 13,//40,
                                color: Colors.grey[600],//[300]
                              ),
                            ),
                          ],
                        ),
                        Row(
                          //organizator
                          children:<Widget>[
                            //Icon(Icons.location_on),
                            Icon(Icons.account_circle),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'organizator ' + value['subtitle'],//event.punchLine1,//event.title,
                              textAlign: TextAlign.left,//TextAlign.center,//TextAlign.right,
                              //style: eventTitleTextStyle,
                              style: TextStyle(
                                fontSize: 13,//40,
                                color: Colors.grey[600],//[300]
                              ),
                            ),
                          ],
                        ),
                        Row(
                          //locatia
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,//MainAxisAlignment.spaceEvenly,
                          /*children: <Widget>[
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,//MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            event.location,
                            //textAlign: TextAlign.right,
                            //style: eventLocationTextStyle,
                          )
                        ],
                      ),
                    ),
                  ],*/

                          mainAxisAlignment: MainAxisAlignment.end,//MainAxisAlignment.spaceAround,//MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //textDirection: TextDirection.rtl,
                          children: <Widget>[
                            /*FittedBox(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    event.location,
                                    //textAlign: TextAlign.right,
                                    style: eventLocationTextStyle,
                                  )
                                ],
                              ),
                            ),*/
                            /*FittedBox(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    event.location, // + ' Lorem Ipsum ',
                                    //textAlign: TextAlign.right,
                                    //style: eventLocationTextStyle,
                                    style: TextStyle(
                                      fontSize: 13,//40,
                                      color: Colors.grey[600],//[300]
                                    ),
                                  )
                                ],
                              ),
                            ),*/
                            Icon(Icons.location_on),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              value['subtitle'],//event.location, // + ' Lorem Ipsum ',
                              //textAlign: TextAlign.right,
                              //style: eventLocationTextStyle,
                              style: TextStyle(
                                fontSize: 13,//40,
                                color: Colors.grey[600],//[300]
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Column(
                              //particip
                              children:<Widget>[
                                /*RaisedButton(
                          onPressed: () {},
                          child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
                        ),*/
                                RaisedButton(
                                  //color: _list[i] ? Colors.green : Colors.red,
                                  color: Colors.orange,
                                  onPressed: () {},
                                  child: const Text('Particip!', style: TextStyle(fontSize: 20)),
                                ),
                                /*Text(
                          'particip',//event.title,
                          //style: eventTitleTextStyle,
                        ),*/
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              //inscrisi
                              children:<Widget>[
                                Row(
                                  children: <Widget>[
                                    //Icon(Icons.location_on),
                                    Text(
                                      '0',//'inscrisi',//event.title,
                                      //style: eventTitleTextStyle,
                                      style: TextStyle(
                                        fontSize: 13,//40,
                                        color: Colors.grey[600],//[300]
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    //Icon(Icons.location_on),//.people .supervisor_account
                                    Icon(Icons.people),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingWidgetMaker() {
    return Container(
      alignment: Alignment.center,
      height: 160.0,
      child: CircularProgressIndicator(),
    );
  }

  Widget errorWidgetMaker(CountriesData2 countriesData, retryListener) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(countriesData.errorMessage),
        ),
        FlatButton(
          onPressed: retryListener,
          child: Text('Retry'),
        )
      ],
    );
  }

  Widget emptyListWidgetMaker(CountriesData2 countriesData) {
    return Center(
      child: Text('No countries in the list'),
    );
  }

  int totalPagesGetter(CountriesData2 countriesData) {
    return countriesData.total;
  }

  bool pageErrorChecker(CountriesData2 countriesData) {
    return countriesData.statusCode != 200;
  }
}

class CountriesData2 {
  //List<dynamic> countries;
  //List<dynamic> events;
  Map<String, dynamic> events;
  int statusCode;
  String errorMessage;
  int total;
  int nItems;

  /*CountriesData2.fromResponse(http.Response response) {
    this.statusCode = response.statusCode;
    List jsonData = json.decode(response.body);
    countries = jsonData[1];
    total = jsonData[0]['total'];
    nItems = countries.length;
  }*/

  CountriesData2.fromResponse(http.Response response, int index) {
    this.statusCode = response.statusCode;
    List jsonData = json.decode(response.body);
    //countries = jsonData[1];
    //countries = jsonData;
    //events = jsonData;
    events = jsonData[index-1];
    //total = jsonData[0]['total'];
    total = jsonData.length;
    //nItems = countries.length;
    //nItems = events.length;
    nItems = jsonData.length;
  }

  CountriesData2.withError(String errorMessage) {
    this.errorMessage = errorMessage;
  }
}