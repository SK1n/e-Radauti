import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:expandable/expandable.dart';

class LocalLegislation extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _launchURL(url) async {
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
      body: ExpandableTheme(
        data:
        const ExpandableThemeData(
          iconColor: Color(0xAA38A49C), //Colors.blue
          useInkWell: true,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 15, top: 20),
                child: Row(
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
                              Icon(Icons.location_city, color: Color(0x55FB6340), size: 30,),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(35.0, 6.0, 0.0, 0.0), //10.0 //25.0
                                  child: Text(
                                    'Administrație locală',
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
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15 ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset("assets/images/circle_EB7D16.svg"),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 90,
                          padding: EdgeInsets.only(left: 10,),
                          child: Text(
                            "Hotărâri de Consiliu Local",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 50,
                      child: Text(
                        "Descoperă hotărârile de consiliu local adoptate și proiectele acestora.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(
                          color: Color(0xFF38A49C),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:15.0),
                child:Container(
                  height:1.0,
                  color:Color.fromRGBO(0, 0, 0, 0.1),),),
              Row(
                children: <Widget>[
                  Padding(
                    padding:EdgeInsets.only(top:15.0, left: 20,),
                    child: Text(
                      "Hotărâri locale",//"ExpandablePanel",
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                ],
              ),

              ExpandableNotifier(
                child: Container(
                  padding: const EdgeInsets.only(left:15, right: 15,),
                  width: MediaQuery.of(context).size.width ,
                  child: Card(
                    margin: const EdgeInsets.only( right: 0, left: 0, bottom: 15.0 ),
//elevation: 4,
//color: Colors.white,
//childAspectRatio: (MediaQuery.of(context).size.width/2 - 22.5) / (MediaQuery.of(context).size.height/5 - 60),
/*shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),*/
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5),//const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[

                                ],
                              ),
                              Column(
                                children: <Widget>[

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
                                padding: EdgeInsets.all(10),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "2020",//"ExpandablePanel",
                                      style: Theme.of(context).textTheme.body2,
                                    ),
                                  ],
                                )
                            ),
                            collapsed: Text(
                              '2020',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                /*Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Descriere',//
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),*/
                                //1
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width -30,
                                    child: new InkWell(
                                        child: new Text(
                                          '1. Hotarare nr. 1 privind aprobarea organigramei şi a statului de funcţii pentru Spitalul Municipal „SF. Dr. COSMA si DAMIAN” Rădăuţi',//,
                                          style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), ),
                                        ),
                                        onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-1-din-30.01.2020.pdf')
                                    ),
                                  ),
                                ),
                                //2
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    //width: MediaQuery.of(context).size.width -136,
                                    child: new InkWell(
                                        child: new Text(
                                          '2. Hotarare nr. 2 privind aprobarea tarifelor pentru serviciile medicale cu plată prestate de către Spitalul Municipal „SF. Dr. COSMA si DAMIAN” Rădăuţi',//
                                          style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), ),
                                        ),
                                        onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-2-din-30.01.2020.pdf')
                                    ),
                                  ),
                                ),
                                //3
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child:
                                  Container(
                                    //width: MediaQuery.of(context).size.width -136,
                                    child: new InkWell(
                                        child: new Text(
                                          '3. Hotarare nr. 3 privind aprobarea Planului anual de acţiune privind serviciile sociale administrate şi finanţate din bugetul local, pentru anul 2020',//
                                          style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), ),
                                        ),
                                        onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-3-din-30.01.2020.pdf')
                                    ),
                                  ),
                                ),
                                //4
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child:
                                  Container(
                                    //width: MediaQuery.of(context).size.width -136,
                                    child: new InkWell(
                                        child: new Text(
                                          '4. Hotarare nr. 4 privind aprobarea preţului pentru colectarea, transportul şi depozitarea deşeurilor în municipiul Rădăuţi',//
                                          style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), ),
                                        ),
                                        onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-4-din-30.01.2020.pdf')
                                    ),
                                  ),
                                ),
                                //5
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child:
                                  Container(
                                    //width: MediaQuery.of(context).size.width -136,
                                    child: new InkWell(
                                        child: new Text(
                                          '5. Hotarare nr. 5 privind aprobarea pentru anul 2020 a Planului de acţiuni sau lucrări de interes local, pentru repartizarea orelor de muncă pentru persoanele beneficiare de prevederile Legii nr. 416/2001 privind venitul minim garantat şi ai Legii nr. 208/1997 privind cantinele de ajutor social, care prestează acţiuni ori lucrări de interes local',//
                                          style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), ),
                                        ),
                                        onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/02/HCL-nr.-5-din-30.01.2020.pdf')
                                    ),
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
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



/*class NewEventWidget extends StatelessWidget {
  final Event event;
  const NewEventWidget({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Container(
          padding: const EdgeInsets.all(0),
          //width: 900,
          child: Card(
            margin: const EdgeInsets.only( right: 0, left: 0, bottom: 15.0 ),
            //elevation: 4,
            //color: Colors.white,
            //childAspectRatio: (MediaQuery.of(context).size.width/2 - 22.5) / (MediaQuery.of(context).size.height/5 - 60),
            /*shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),*/
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5),//const EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[

                        ],
                      ),
                      Column(
                        children: <Widget>[

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
                          "",//"ExpandablePanel",
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
                            event.description,//
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
        ),
    );
  }
}*/