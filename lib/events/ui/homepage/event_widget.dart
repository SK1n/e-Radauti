import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterapperadauti/events/styleguide.dart'; //import 'package:flutterapp/styleguide.dart';
import '../../model/event.dart';

//import 'package:flutterapperadauti/TownHall/town_hall_main.dart';

class EventWidget extends StatelessWidget {

  //final Event event;
  final Event2 event;

  const EventWidget({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return Card(
      margin: const EdgeInsets.symmetric(vertical: 20),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Padding(
        //padding: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30),),
              child: Image.network(
                event.imagePath,
                height: 150, fit: BoxFit.fitWidth,
              ),//Image.asset(event.imagePath, height: 150, fit: BoxFit.fitWidth,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0,),
              child:Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          event.title,
                          style: eventTitleTextStyle,
                        ),
                        SizedBox(height: 10,),
                        FittedBox(
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
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      event.duration.toUpperCase(),
                      textAlign: TextAlign.right,
                      style: eventLocationTextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );*/

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        //borderRadius: BorderRadius.all(Radius.circular(24)),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child: Padding(
        //padding: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(5),//const EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  event.day + '\n' + event.month,//'27\nAPR', //'data',//event.duration.toUpperCase(),
                  textAlign: TextAlign.center,//TextAlign.right,
                  /*style: eventLocationTextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),*/
                  style: TextStyle(
                    fontSize: 18,//40,//13 //16
                    color: Colors.grey[600],//[300]
                  ),
                ),

                Text(
                  '----------',//'ora',//event.duration.toUpperCase(),
                  textAlign: TextAlign.center,//TextAlign.right,
                  style: TextStyle(
                    fontSize: 18,//40,//16
                    color: Colors.grey[600],//[300]
                  ),
                ),

                /*const DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: const Text('Some text...'),
                    ),*/
                new DecoratedBox(
                  decoration: new BoxDecoration(
                      color: Colors.grey, //blue
                      borderRadius: BorderRadius.circular(2.0),//20.0
                    ),
                  child: new Padding(
                    padding: const EdgeInsets.only(left:5, right:5), //const EdgeInsets.all(5)
                    child: new Text( //const
                      event.hour,//'13:09', //'ora',//event.duration.toUpperCase(),
                      textAlign: TextAlign.center,//TextAlign.right,
                      /*style: eventLocationTextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),*/
                      style: TextStyle(
                        fontSize: 18,//40,//13 //16
                        color: Colors.white,//color: Colors.blueGrey,//[300]
                      ),
                    ),//Text('Some text...'),
                  ),

                ),

              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:5, right:5), //const EdgeInsets.all(5)
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10),),
                            child: Image.network(
                              event.imagePath,
                              height: 150,//120,//150,
                              fit: BoxFit.fitHeight,//BoxFit.fitWidth,
                              width: 100,//150,//50,
                            ),//Image.asset(event.imagePath, height: 150, fit: BoxFit.fitWidth,),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start, //MainAxisAlignment.spaceBetween,//MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          //titlu
                          children:<Widget>[
                            Container(
                              width: 170,//150,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0), //10.0 //25.0
                                //child: Text('Evenimente'),
                                child: Text(
                                  event.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xAA38A49C), //Color(0xAAFB6340), //Colors.orange[300],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          //categoria
                          children:<Widget>[
                            //Icon(Icons.location_on),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                child: Icon(Icons.category),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 170,//150,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0), //10.0 //25.0
                                //child: Text('Evenimente'),
                                child: Text(
                                  'Categoria: ' + event.categoryName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 13,//40,
                                    color: Colors.grey[600],//[300]
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        Row(
                          //organizator
                          children:<Widget>[
                            //Icon(Icons.location_on),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                child: Icon(Icons.account_circle),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 170,//150,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0), //10.0 //25.0
                                //child: Text('Evenimente'),
                                child: Text(
                                  'Organizator: ' + event.organization,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 13,//40,
                                    color: Colors.grey[600],//[300]
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        Row(
                          //locatia
                          //mainAxisAlignment: MainAxisAlignment.end,//MainAxisAlignment.spaceAround,//MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          //textDirection: TextDirection.rtl,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                              child: Container(
                                child: Icon(Icons.location_on),
                              ),
                            ),
                            Container(
                              width: 170,
                              child: new Stack(
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0), //10.0 //25.0
                                      //child: Text('Evenimente'),
                                      child: Text(
                                        event.location,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: 13,//40,
                                          color: Colors.grey[600],//[300]
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        /*Row(
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
                                  color: Color(0xAA38A49C), //Color(0xAAFB6340), //Colors.orange,
                                  onPressed: () {},
                                  child: const Text(
                                      'Particip!',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,//Color(0xAAFB6340),
                                      ),
                                  ),
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
                                  textDirection: TextDirection.rtl,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        //Icon(Icons.location_on),
                                        /*Column(
                                      children: <Widget>[
                                        Text(
                                          '0',//'inscrisi',//event.title,
                                          //style: eventTitleTextStyle,
                                          style: TextStyle(
                                            fontSize: 13,//40,
                                            color: Colors.grey[600],//[300]
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Icon(Icons.people),
                                      ],
                                    ),*/
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
                        ),*/
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
}