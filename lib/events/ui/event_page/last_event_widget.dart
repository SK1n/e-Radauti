import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//import 'package:flutterapp/styleguide.dart';
import '../../model/event.dart';
import 'package:expandable/expandable.dart';

class LastEventWidget extends StatelessWidget {
  final EventApp event;
  const LastEventWidget({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        margin: const EdgeInsets.only(right: 0, left: 0, bottom: 15.0),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5), //const EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        event.day +
                            '\n' +
                            event
                                .month, //'27\nAPR', //'data',//event.duration.toUpperCase(),
                        textAlign: TextAlign.center, //TextAlign.right,
                        style: TextStyle(
                          fontSize: 18, //40,//13 //16
                          color: Colors.grey[600], //[300]
                        ),
                      ),
                      Text(
                        '----------', //'ora',//event.duration.toUpperCase(),
                        textAlign: TextAlign.center, //TextAlign.right,
                        style: TextStyle(
                          fontSize: 18, //40,//16
                          color: Colors.grey[600], //[300]
                        ),
                      ),
                      new DecoratedBox(
                        decoration: new BoxDecoration(
                          color: Colors.grey, //blue
                          borderRadius: BorderRadius.circular(2.0), //20.0
                        ),
                        child: new Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5), //const EdgeInsets.all(5)
                          child: new Text(
                            //const
                            event
                                .hour, //'13:09', //'ora',//event.duration.toUpperCase(),
                            textAlign: TextAlign.center, //TextAlign.right,
                            style: TextStyle(
                              fontSize: 18, //40,//13 //16
                              color:
                                  Colors.white, //color: Colors.blueGrey,//[300]
                            ),
                          ), //Text('Some text...'),
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
                                padding: const EdgeInsets.only(
                                    left: 5,
                                    right: 5), //const EdgeInsets.all(5)
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: Image.network(
                                    event.imagePath,
                                    height: MediaQuery.of(context).size.height /
                                        4, //120,//150,
                                    fit: BoxFit.fitHeight, //BoxFit.fitWidth,
                                    width: MediaQuery.of(context).size.width /
                                        4, //150,//50,
                                  ), //Image.asset(event.imagePath, height: 150, fit: BoxFit.fitWidth,),
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
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                            2 -
                                        ((MediaQuery.of(context).size.width /
                                                    4) /
                                                4 +
                                            30), //150,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 5.0, 0.0, 0.0), //10.0 //25.0
                                      //child: Text('Evenimente'),
                                      child: Text(
                                        event.title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(
                                              0xAA38A49C), //Color(0xAAFB6340), //Colors.orange[300],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                //categoria
                                children: <Widget>[
                                  //Icon(Icons.location_on),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      child: Icon(Icons.category),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                            2 -
                                        ((MediaQuery.of(context).size.width /
                                                    4) /
                                                4 +
                                            30.0), //150,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 5.0, 0.0, 0.0), //10.0 //25.0
                                      //child: Text('Evenimente'),
                                      child: Text(
                                        'Categoria: ' + event.categoryName,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13, //40,
                                          color: Colors.grey[600], //[300]
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                //organizator
                                children: <Widget>[
                                  //Icon(Icons.location_on),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      child: Icon(Icons.account_circle),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                            2 -
                                        ((MediaQuery.of(context).size.width /
                                                    4) /
                                                4 +
                                            30.0), //150,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 5.0, 0.0, 0.0), //10.0 //25.0
                                      //child: Text('Evenimente'),
                                      child: Text(
                                        'Organizator: ' + event.organization,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13, //40,
                                          color: Colors.grey[600], //[300]
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
                                    padding:
                                        EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                                    child: Container(
                                      child: Icon(Icons.location_on),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                            2 -
                                        ((MediaQuery.of(context).size.width /
                                                    4) /
                                                4 +
                                            30.0),
                                    child: new Stack(
                                      children: <Widget>[
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(0.0,
                                                5.0, 0.0, 5.0), //10.0 //25.0
                                            //child: Text('Evenimente'),
                                            child: Text(
                                              event.location,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              style: TextStyle(
                                                fontSize: 13, //40,
                                                color: Colors.grey[600], //[300]
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "", //"ExpandablePanel",
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.body2,
                    )),
                collapsed: Text(
                  '',
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        event.description, //
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 0),
                    child: Expandable(
                      //collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
