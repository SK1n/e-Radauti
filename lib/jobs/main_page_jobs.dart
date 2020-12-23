import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/appBarModel.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/jobs/furniture_page.dart';
import 'package:flutterapperadauti/jobs/job_page.dart';

class HomePageJobs extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel()
          .loadAppBar(context, 'Anunțuri', Icons.announcement, _scaffoldKey),
      drawer: NavDrawer2(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 10,
                top: 15,
              ),
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                  'assets/images/circle_FFDECC.svg'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                'Locuri de Muncă',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            'Locuri de muncă preluate de pe portalul www.eradauti.ro',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              color: Color(0xFF38A49C),
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF979797),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JobPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 10,
                top: 10,
              ),
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                  'assets/images/circle_69E781.svg'),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 120,
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                'Imobiliare',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          width: MediaQuery.of(context).size.width - 80,
                          child: Text(
                            'Anunțuri de imobiliare preluate de pe portalul www.eradauti.ro',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              color: Color(0xFF38A49C),
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF979797),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FurniturePage()),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),

            /*Padding(
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),*/
          ],
        ),
      ),
    );
  }
/*Widget build(BuildContext context) {
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
            margin: EdgeInsets.only(
                top: 0.0,
                right: 0.0), // EdgeInsets.only(top: 20.0, right: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size: 24,
                color: Colors.black,
              ), //Colors.white
              onPressed: () => _scaffoldKey.currentState
                  .openDrawer(), //_scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ],
      ),
      drawer: NavDrawer2(),
      body: RemoteJson(),
    );
  }*/
}
