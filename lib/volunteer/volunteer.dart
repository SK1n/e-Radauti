import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class VolunteerPage extends StatelessWidget {
  VolunteerPage({
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
                              Icon(FontAwesome5.hand_holding_heart, color: Color(0x55FB6340), size: 30,),
                              SizedBox(width: 5,),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(35.0, 6.0, 0.0, 0.0,), //10.0 //25.0
                                  child: Text(
                                    'Voluntariat',
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
              height: 1250,
              child: Container(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(15),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio: (MediaQuery.of(context).size.width / 2 - 22.5)/280,
                  //childAspectRatio: 1.1,
                  //(MediaQuery.of(context).size.width / 2 - 22.5) /
                  //    (MediaQuery.of(context).size.height / 5 - 60),
                  children: <Widget>[
                    GestureDetector(
                      onTap: null,
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
                                "assets/images/volunteer/rc_logo_web.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('Rădăuțiul Civic',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('Domeniul: Civic',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('Telefon: 0741 975 076',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Container(
                                //padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('radautiulcivic@gmail',
                                      style: new TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    new Text('.com',
                                      style: new TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new InkWell(
                                child: new Text(
                                  'www.radautiulcivic.ro',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFF38A49C),
                                    fontSize: 15,
                                  ),
                                ),
                                onTap: () => UrlLauncher.launch(
                                    'https://www.radautiulcivic.ro/'),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    GestureDetector(
                      onTap: null,
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
                                "assets/images/volunteer/toastmasters.jpg", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('Toastmasters',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    new Text('Rădăuți',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new Container(
                                //padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('Domeniul: Dezvoltare',
                                      style: new TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    new Text('personală, Public',
                                      style: new TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    new Text('speaking',
                                      style: new TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new Text('Telefon: 0740 757 280',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('radautitm@gmail.com'),
                              new InkWell(
                                child: new Container(
                                  //padding: new EdgeInsets.only(top: 3.0),
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Text('www.facebook.com/',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF38A49C),
                                          fontSize: 15,
                                        ),
                                      ),
                                      new Text('radautitoastmasters/',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF38A49C),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () => UrlLauncher.launch(
                                    'https://www.facebook.com/radautitoastmasters/'),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    //2
                    GestureDetector(
                      onTap: null,
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3,right: 3, left: 3,
                          ),
                          child: new Column(
                            children: <Widget>[
                              new Image.asset(
                                "assets/images/volunteer/eco_montan.jpg", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('Club Eco Montan',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Container(
                                //padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('Domeniul: Drumeții',
                                      style: new TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    new Text('montane, Mediu',
                                      style: new TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new Text('Telefon: 0746 814 430',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              //new Text('clubulecomontan@gmail.com'),
                              new Container(
                                //padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('clubulecomontan@',
                                      style: new TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    new Text('gmail.com',
                                      style: new TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new InkWell(
                                child:
                                new Container(
                                  //padding: new EdgeInsets.only(top: 3.0),
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Text('www.facebook.com/',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF38A49C),
                                          fontSize: 15,
                                        ),
                                      ),
                                      new Text('ClubulEcoMontan',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF38A49C),
                                          fontSize: 15,
                                        ),
                                      ),
                                      new Text('BucovinaRadauti/',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF38A49C),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () => UrlLauncher.launch(
                                    'https://www.facebook.com/ClubulEcoMontanBucovinaRadauti/'),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    GestureDetector(
                      onTap: null,
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
                                "assets/images/volunteer/asociatia_bafi.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('BAFI (Bucuria',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    new Text('de a fi)',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new Container(
                                //padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('Domeniul: Social,',
                                      style: new TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    new Text('Ecologie',
                                      style: new TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new Text('Telefon: 0755 403 224',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('asociatia@bafi.ro'),
                              new InkWell(
                                child: new Text(
                                  'www.bafi.ro',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFF38A49C),
                                    fontSize: 15,
                                  ),
                                ),
                                onTap: () => UrlLauncher.launch(
                                    'http://www.bafi.ro'),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    //3
                    GestureDetector(
                      onTap: null,
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
                                "assets/images/volunteer/door_to_home.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('Asociația Door',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    new Text('to Home',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new Container(
                                //padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('Domeniul: Social,',
                                      style: new TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    new Text('Filantropic',
                                      style: new TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new Text('Telefon: 0230 562 751',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('info@doortohome.ro'),
                              new InkWell(
                                child: new Text(
                                  'doortohome.ro',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xFF38A49C),
                                    fontSize: 15,
                                  ),
                                ),
                                onTap: () => UrlLauncher.launch(
                                    'http://doortohome.ro/'),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    GestureDetector(
                      onTap: null,
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
                                "assets/images/volunteer/maria_ward.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('Asociația Maria',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    new Text('Ward',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new Text('Domeniul: Social',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('Telefon: 0757 114 181',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Container(
                                //padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('centrul.mariaward',
                                      style: new TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    new Text('@gmail.com',
                                      style: new TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new InkWell(
                                  child:
                                  new Container(
                                    //padding: new EdgeInsets.only(top: 3.0),
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        new Text('centrulsocialmaria',
                                          style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                            fontSize: 15,
                                          ),
                                        ),
                                        new Text('ward.org',
                                          style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () => UrlLauncher.launch(
                                      'https://centrulsocialmariaward.org/'),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    //4
                    GestureDetector(
                      onTap: null,
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
                                "assets/images/volunteer/umania.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
                                width: 80.0, //50.0, //25.0,
                                height: 80.0, //50.0, //25.0,
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 3.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('Asociația Umania',
                                      style: new TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,),)],),),
                              new Text('Domeniul: Social',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Text('Telefon: -',style: new TextStyle(fontSize: 14, color: Colors.grey[800]),),
                              new Container(
                                //padding: new EdgeInsets.only(top: 3.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Text('ioanadeliar@',
                                      style: new TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    new Text('gmail.com',
                                      style: new TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              new InkWell(
                                  child:
                                  new Container(
                                    //padding: new EdgeInsets.only(top: 3.0),
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        new Text('www.facebook.com/',
                                          style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                            fontSize: 15,
                                          ),
                                        ),
                                        new Text('umania.ffs',
                                          style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Color(0xFF38A49C),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () => UrlLauncher.launch(
                                      'https://www.facebook.com/umania.ffs'),
                              ),
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