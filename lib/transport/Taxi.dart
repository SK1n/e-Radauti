import 'package:flutter/material.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Taxi extends StatelessWidget {
  Taxi({
    Key key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
              child: Container(
                padding: const EdgeInsets.only(top: 20,),
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFF979797),),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: new Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Icon(Icons.local_taxi, color: Color(0x55FB6340), size: 30,),
                              SizedBox(width: 5,),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(35.0, 6.0, 0.0, 0.0,), //10.0 //25.0
                                  child: Text(
                                    'Taximetriști',
                                    style: TextStyle(
                                      color: Color(0xFF000000), //Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
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
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: (MediaQuery.of(context).size.height + 450),
              child: Container(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(15),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  //childAspectRatio: 1.1,
                  //(MediaQuery.of(context).size.width / 2 - 22.5) /
                  //    (MediaQuery.of(context).size.height / 5 - 60),
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        UrlLauncher.launch("tel://0740348225");
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/Taxi/SV12NLJ.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('BOICU COSTICĂ',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('DACIA LOGAN',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('0740 348 225',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('SV-12NLJ'),
                            ],
                          ),
                        ),

                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        UrlLauncher.launch("tel://0742041403");
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/Taxi/SV27COV.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('COVAȘĂ SORIN',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('DACIA LOGAN',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('0742 041 403',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('SV-27COV'),
                            ],
                          ),
                        ),

                      ),
                    ),
                    //2
                    GestureDetector(
                      onTap: () {
                        UrlLauncher.launch("tel://0766210240");
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3,),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/Taxi/SV13NOC.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('DIACONESCU FLORIN',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('VW TOURAN (CREM)',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('0766 210 240',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('SV-13NOC'),
                            ],
                          ),
                        ),

                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        UrlLauncher.launch("tel://0740593510");
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/Taxi/SV11NEL.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('GRAB IOAN',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('MERCEDES E-CLASS',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('0740 593 510',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('SV-11NEL'),
                            ],
                          ),
                        ),

                      ),
                    ),
                    //3
                    GestureDetector(
                      onTap: () {
                        UrlLauncher.launch("tel://0741283879");
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/Taxi/SV62LAZ.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('LAZĂR GHEORGHE',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('DACIA SANDERO',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('0741 283 879',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('SV-62LAZ'),
                            ],
                          ),
                        ),

                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        UrlLauncher.launch("tel://0742161708");
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/Taxi/SV12TWL.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('MIHALESCU TONI',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('DACIA LOGAN',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('0742 161 708',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('SV-12TWL'),
                            ],
                          ),
                        ),

                      ),
                    ),
                    //4
                    GestureDetector(
                      onTap: () {
                        UrlLauncher.launch("tel://0744622405");
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/Taxi/SV74MSV.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('PASLARIU MIHAI',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('VOLKSWAGEN',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('0744 622 405',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('SV-74MSV'),
                            ],
                          ),
                        ),

                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        UrlLauncher.launch("tel://0741697725");
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/Taxi/SV21PCR.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('PESCLEVEI RADU',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('DACIA DOKKER',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('0741 697 725',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('SV-21PCR'),
                            ],
                          ),
                        ),

                      ),
                    ),
                    //5
                    GestureDetector(
                      onTap: () {
                        UrlLauncher.launch("tel://0754554488");
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/Taxi/SV01LMM.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('ROSE TAXI',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('DACIA LOGAN',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('0754 554 488',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('SV-01LMM'),
                            ],
                          ),
                        ),

                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        UrlLauncher.launch("tel://0745536280");
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/Taxi/SV04PNZ.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('TIPERCIUC VASILE',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('DACIA LOGAN',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('0745 536 280',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('SV-04PNZ'),
                            ],
                          ),
                        ),

                      ),
                    ),
                    //6
                    GestureDetector(
                      onTap: () {
                        UrlLauncher.launch("tel://0745683668");
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/Taxi/SV16TOD.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('TODERAȘ VIOREL',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('VW PASSAT',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('0745 683 668',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('SV-16TOD'),
                            ],
                          ),
                        ),

                      ),
                    ),
                    //
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}