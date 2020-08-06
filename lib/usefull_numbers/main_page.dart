import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:flutterapperadauti/usefull_numbers/public_institutions.dart';

class HomePageNumbers extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        leading: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
          child: Image.asset("assets/logo_images/app_logo.png"),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 0.0, right: 0.0), // EdgeInsets.only(top: 20.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.menu,
                size: 24,
                color: Colors.black, ), //Colors.white
              onPressed: () => _scaffoldKey.currentState.openDrawer(), //_scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ],
      ),
      drawer: NavDrawer2(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFF979797),), //_left Icons.arrow_back
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width-80,
                  child: new Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Icon(Icons.call, color: Color(0x55FB6340),),
                          SizedBox(width: 5,),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30.0, 4.0, 0.0, 0.0), //10.0 //25.0
                              child: Text(
                                'Numere Utile',
                                style: TextStyle(
                                  color: Color(0xFF000000), //Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: FlatButton(
                        child: SvgPicture.asset('assets/images/circle_FFDECC.svg'),
                        onPressed: null,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text('Numere de urgenta',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text('Lorem ipsum dolor sit amet dum pendebat morsum col.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                onTap: null,
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: FlatButton(
                        child: SvgPicture.asset('assets/images/circle_69E781.svg'),
                        onPressed: null,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text('Deranjamente',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text('Lorem ipsum dolor sit amet dum pendebat morsum col.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                onTap: null,
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: FlatButton(
                        child: SvgPicture.asset('assets/images/circle_194C80.svg'),
                        onPressed: null,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text('Institutii publice',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text('Lorem ipsum dolor sit amet dum pendebat morsum col.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PublicInstitutions()),);},
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: FlatButton(
                        child: SvgPicture.asset('assets/images/circle_EB7D16.svg'),
                        onPressed: null,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text('Tehnicieni si alti specialisti',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text('Lorem ipsum dolor sit amet dum pendebat morsum col.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                onTap: null,
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
          ],
        ),
      ),
    );
  }
}