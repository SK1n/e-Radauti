import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';

class LocalCouncil extends StatefulWidget {
  @override
  _LocalCouncilState createState() => _LocalCouncilState();
}

class _LocalCouncilState extends State<LocalCouncil> {
  //1
  String dropdownValue1 = "Platforma de contact";
  String _recipientController1;
  bool _validateDropDown1 = false;
  //3
  String dropdownValue3 = "Platforma de contact";
  String _recipientController3;
  bool _validateDropDown3 = false;
  //5
  String dropdownValue5 = "Platforma de contact";
  String _recipientController5;
  bool _validateDropDown5 = false;
  //13
  String dropdownValue13 = "Platforma de contact";
  String _recipientController13;
  bool _validateDropDown13 = false;
  //16
  String dropdownValue16 = "Platforma de contact";
  String _recipientController16;
  bool _validateDropDown16 = false;
  //17
  String dropdownValue17 = "Platforma de contact";
  String _recipientController17;
  bool _validateDropDown17 = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget addLeadingIcon() {
    return new Container(
      //height: 110.0, //50.0, //25.0,
      //width: 110.0, //50.0, //25.0,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0,
          0.0), //EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0), //EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(
          15.0, 5.0, 0.0, 5.0), //const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          new Image.asset(
            "assets/logo_images/app_logo.png", //"assets/logo_images/app_logo_final2.jpg", //Constant.iconNotification,
            //width: 90.0, //50.0, //25.0,
            //height: 90.0, //50.0, //25.0,
          ),
          /*new FlatButton(
              onPressed: (){
                onLeadingShowCategoryClick();
              }
          )*/
        ],
      ),
    );
  }

  // This widget is the root of your application.
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
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 15, top: 20),
              child: Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      //YourScrollViewWidget(),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          color: Color(0xFF979797),
                        ), //_left Icons.arrow_back
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: new Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Icon(
                              Icons.location_city,
                              color: Color(0x55FB6340),
                              size: 30,
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    35.0, 6.0, 0.0, 0.0), //10.0 //25.0
                                child: Text(
                                  'Administrație locală',
                                  style: TextStyle(
                                    color:
                                        Color(0xFF000000), //Color(0xFFFFFFFF),
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
              padding:
                  EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        child:
                            SvgPicture.asset("assets/images/circle_194C80.svg"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 90,
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          "Consiliul Local",
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
                      "Consilierii locali și atribuțiile lor. \nContactează-ți reprezentantul.",
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
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/AirineiCristina.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/psd.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Airinei Cristina",
                                style: TextStyle(
                                    color: Color(0xFF38A49C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Covaliu-Tiberiu.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Covaliu-Tiberiu-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  /*Container(
                    padding: EdgeInsets.only(top: 10,),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: () {
                        /*UrlLauncher.launch(
                            "mailto:primar@primariaradauti.ro");*/
                        UrlLauncher.launch("tel://0722458858");
                      },
                    ),
                  ),*/
                  /*Container(
                    padding: EdgeInsets.only(top: 10.0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: Icon(
                            Ionicons.logo_facebook,
                            color: Colors.indigo,
                            size: 40,
                          ),
                          onPressed: () {
                            //_launchURL("https://www.facebook.com/BogdanLoghinPNL/");
                            UrlLauncher.launch(
                                "https://www.facebook.com/airinei.cristina.7");
                          },
                        ),

                        FlatButton(
                          child: Icon(
                            Ionicons.ios_mail,
                            color: Colors.orangeAccent,
                            size: 40,
                          ),
                          onPressed: () {
                            /*UrlLauncher.launch(
                              "mailto:primar@primariaradauti.ro");*/
                            UrlLauncher.launch("tel://0722458858");
                          },
                        ),
                      ],
                    ),
                  ),*/
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    child: new DropdownButton<String>(
                      value: dropdownValue1,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Platforma de contact',
                        'Facebook',
                        'Telefon',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: new Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          dropdownValue1 = value;
                          dropDownValueIdentifier1(value);
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: () {
                        if (_validateDropDown1 == true) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Nu ați selectat o categorie!"),
                          ));
                        } else {
                          UrlLauncher.launch(_recipientController1);
                        }
                        ;
                        /*UrlLauncher.launch(
                            "mailto:primar@primariaradauti.ro");*/
                        //UrlLauncher.launch("tel://0722458858");
                      },
                    ),
                  ),
                ],
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
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/CalenciucAnca.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pnl.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Calenciuc Anca-Elena",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Chitruc-Ilie.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Chitriuc-Ilie.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: null, /*() {
                      },*/
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            //2
            Container(
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/DoroscanFlorin.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pnl.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Doroscan Florin-Constantin",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Carcalete-Petru.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Carcalete-Petru-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    child: new DropdownButton<String>(
                      value: dropdownValue3,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Platforma de contact',
                        'Email',
                        'Telefon',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: new Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          dropdownValue3 = value;
                          dropDownValueIdentifier3(value);
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: () {
                        if (_validateDropDown3 == true) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Nu ați selectat o categorie!"),
                          ));
                        } else {
                          UrlLauncher.launch(_recipientController3);
                        }
                        ;
                        /*UrlLauncher.launch(
                            "mailto:primar@primariaradauti.ro");*/
                        //UrlLauncher.launch("tel://0722458858");
                      },
                    ),
                  ),
                ],
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
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/JecaloAdi.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/psd.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Jecalo Adi Gheorghiță",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Cojocar-Vasile-Codrutu.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Cojocar-Vasile-Codrutu-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed:
                          null, /*() {
                        //UrlLauncher.launch("mailto:registratura@primarie.ro");
                      },*/
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            //3
            Container(
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/LuchianConstantin.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pnl.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Luchian Constantin",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Grijincu-Marius-Costel.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Grijincu-Marius.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    child: new DropdownButton<String>(
                      value: dropdownValue5,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Platforma de contact',
                        'Email',
                        'Telefon',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: new Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          dropdownValue5 = value;
                          dropDownValueIdentifier5(value);
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: () {
                        if (_validateDropDown5 == true) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Nu ați selectat o categorie!"),
                          ));
                        } else {
                          UrlLauncher.launch(_recipientController5);
                        }
                        ;
                        /*UrlLauncher.launch(
                            "mailto:primar@primariaradauti.ro");*/
                        //UrlLauncher.launch("tel://0722458858");
                      },
                    ),
                  ),
                ],
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
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/MartinescuPaul.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pnl.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Martinescu Paul-Tudor",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Jecalo-Gheorghita.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Jecalo-Gheorghita-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: null, /*() {
                      },*/
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            //4
            Container(
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/MitrofanIonel.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/psd.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Mitrofan Ionel",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Hacman-Mircea.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Hacman-Mircea-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: null, /*() {
                      },*/
                    ),
                  ),
                ],
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
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/NanuLucian.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pmp.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Nanu Lucian-Mihai",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Mehedin-Maria.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Mehedin-Maria-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: () {
                        UrlLauncher.launch("mailto:luciannanu@yahoo.com");
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            //5
            Container(
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/NichiforiucCristina.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pnl.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Nichiforiuc Cristina-Nicoleta",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Miron-Catalin.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Miron-Catalin-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: null, /*() {
                      },*/
                    ),
                  ),
                ],
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
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/NicolauBogdan.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pmp.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Nicolau Bogdan-Adrian",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Popescu-Angelica.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Popescu-Angelica-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: null, /*() {
                      },*/
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            //6
            Container(
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/OlareanAurel.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/per.jpg"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Olărean Aurel",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Mutrescu-Dan.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Mutrescu-Dan-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: null, /*() {
                      },*/
                    ),
                  ),
                ],
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
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/OnicaMarius.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pnl.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Onica Marius-Nicolae",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Negrut-Catalin-Romeo.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Negrut-Romeo.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: () {
                        UrlLauncher.launch("mailto:onica.marius@gmail.com");
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            //7
            Container(
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/PredaFlorin.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/psd.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Preda Florin-Mirel",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Nicolau-Bogdan.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Nicolau-Bogdan-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    child: new DropdownButton<String>(
                      value: dropdownValue13,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Platforma de contact',
                        'Email',
                        'Facebook',
                        'Telefon',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: new Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          dropdownValue13 = value;
                          dropDownValueIdentifier13(value);
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: () {
                        if (_validateDropDown13 == true) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Nu ați selectat o categorie!"),
                          ));
                        } else {
                          UrlLauncher.launch(_recipientController13);
                        }
                        ;
                        /*UrlLauncher.launch(
                            "mailto:primar@primariaradauti.ro");*/
                        //UrlLauncher.launch("tel://0722458858");
                      },
                    ),
                  ),
                ],
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
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/SimotaGheorghe.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/psd.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Simota Gheorghe",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Preda-Florin.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Preda-Florin-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed:
                          null, /*() {
                        //UrlLauncher.launch("mailto:registratura@primarie.ro");
                      },*/
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            //8
            Container(
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/TatarNistor.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/psd.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Tatar Nistor",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C),),
                                    ),
                                    //onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Covaliu-Tiberiu.pdf')
                                    onTap: null, //() {}
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C),),
                                    ),
                                    //onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Covaliu-Tiberiu-1.pdf')
                                    onTap: null, //() {}
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: () {
                        /*UrlLauncher.launch(
                            "mailto:primar@primariaradauti.ro");*/
                        UrlLauncher.launch("tel://0736358130");
                      },
                    ),
                  ),
                ],
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
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/TibeicaSilviu.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pnl.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Tibeică Silviu-Cătălin",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Robu-Sorin.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Robu-Sorin-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    child: new DropdownButton<String>(
                      value: dropdownValue16,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Platforma de contact',
                        'Email',
                        'Facebook',
                        'Telefon',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: new Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          dropdownValue16 = value;
                          dropDownValueIdentifier16(value);
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: () {
                        if (_validateDropDown16 == true) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Nu ați selectat o categorie!"),
                          ));
                        } else {
                          UrlLauncher.launch(_recipientController16);
                        }
                        ;
                        /*UrlLauncher.launch(
                            "mailto:primar@primariaradauti.ro");*/
                        //UrlLauncher.launch("tel://0722458858");
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            //9
            Container(
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/TironWerner.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pnl.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Tiron Werner",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Simota-Gheorghe.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Simota-Gheorghe-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    child: new DropdownButton<String>(
                      value: dropdownValue17,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Platforma de contact',
                        'Email',
                        'Telefon',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: new Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          dropdownValue17 = value;
                          dropDownValueIdentifier17(value);
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: () {
                        if (_validateDropDown17 == true) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Nu ați selectat o categorie!"),
                          ));
                        } else {
                          UrlLauncher.launch(_recipientController17);
                        }
                        ;
                        /*UrlLauncher.launch(
                            "mailto:primar@primariaradauti.ro");*/
                        //UrlLauncher.launch("tel://0722458858");
                      },
                    ),
                  ),
                ],
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
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/TareviciCezar.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pnl.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Tarevici Cezar-Ciprian",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Tarevici-Cezar-Ciprian.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Tarevici-Ciprian.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: null, /*() {
                      },*/
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 1.0,
                color: Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ),
            //10
            Container(
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 30),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 91,
                            width: 91,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/council/VasiloschiIulian.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/psd.png"),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Vasiloschi Iulian-Teodor",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Consilier Local",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Comisii:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de avere',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Dan-Vatra.pdf')
                                  ),
                                  new InkWell(
                                    child: new Text(
                                      'Declarație de interese',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                    ),
                                    onTap:
                                        null, //() => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Dan-Vatra-1.pdf')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: MediaQuery.of(context).size.width - 35,
                    child: FlatButton(
                      child: Text(
                        "Contactează",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF38A49C),
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Color(0x8838A49C),
                      onPressed: () {
                        /*UrlLauncher.launch(
                            "mailto:primar@primariaradauti.ro");*/
                        UrlLauncher.launch("tel://0752336791");
                      },
                    ),
                  ),
                ],
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

  // _validateDropDown is true if selected values is 'Destinatar' and the
// user will get a message saying that he has to select a delivery location
// else _validateDropDown is false and _recipientController gets the address to delivery location
  void dropDownValueIdentifier1(value) {
    switch (value) {
      case "Platforma de contact":
        {
          _recipientController1 = null;
          _validateDropDown1 = true;
          debugPrint('valoare email: $_recipientController1');
        }
        break;
      case "Facebook":
        {
          _recipientController1 = "https://www.facebook.com/airinei.cristina.7";
          _validateDropDown1 = false;
          debugPrint('valoare email: $_recipientController1');
        }
        break;
      case "Telefon":
        {
          _recipientController1 = "tel://0722458858";
          _validateDropDown1 = false;
          debugPrint('valoare email: $_recipientController1');
        }
        break;
    }
  }

  //3
  void dropDownValueIdentifier3(value) {
    switch (value) {
      case "Platforma de contact":
        {
          _recipientController3 = null;
          _validateDropDown3 = true;
          debugPrint('valoare email: $_recipientController3');
        }
        break;
      case "Email":
        {
          _recipientController3 = "mailto:fdoroscan@gmail.com";
          _validateDropDown3 = false;
          debugPrint('valoare email: $_recipientController3');
        }
        break;
      case "Telefon":
        {
          _recipientController3 = "tel://0744848138";
          _validateDropDown3 = false;
          debugPrint('valoare email: $_recipientController3');
        }
        break;
    }
  }

  //5
  void dropDownValueIdentifier5(value) {
    switch (value) {
      case "Platforma de contact":
        {
          _recipientController5 = null;
          _validateDropDown5 = true;
          debugPrint('valoare email: $_recipientController5');
        }
        break;
      case "Email":
        {
          _recipientController5 = "mailto:luchianct@gmail.com";
          _validateDropDown5 = false;
          debugPrint('valoare email: $_recipientController5');
        }
        break;
      case "Telefon":
        {
          _recipientController5 = "tel://0744508199";
          _validateDropDown5 = false;
          debugPrint('valoare email: $_recipientController5');
        }
        break;
    }
  }

  //13
  void dropDownValueIdentifier13(value) {
    switch (value) {
      case "Platforma de contact":
        {
          _recipientController13 = null;
          _validateDropDown13 = true;
          debugPrint('valoare email: $_recipientController13');
        }
        break;
      case "Email":
        {
          _recipientController13 = "mailto:eu.consulting17@gmail.com";
          _validateDropDown13 = false;
          debugPrint('valoare email: $_recipientController13');
        }
        break;
      case "Facebook":
        {
          _recipientController13 =
              "https://www.facebook.com/preda.florin.mirel";
          _validateDropDown13 = false;
          debugPrint('valoare email: $_recipientController13');
        }
        break;
      case "Telefon":
        {
          _recipientController13 = "tel://0787886725";
          _validateDropDown13 = false;
          debugPrint('valoare email: $_recipientController13');
        }
        break;
    }
  }

  //16
  void dropDownValueIdentifier16(value) {
    switch (value) {
      case "Platforma de contact":
        {
          _recipientController16 = null;
          _validateDropDown16 = true;
          debugPrint('valoare email: $_recipientController16');
        }
        break;
      case "Email":
        {
          _recipientController16 =
              "mailto:tibeica.silviu.catalin@protonmail.com";
          _validateDropDown16 = false;
          debugPrint('valoare email: $_recipientController16');
        }
        break;
      case "Facebook":
        {
          _recipientController16 =
              "https://www.facebook.com/tibeicasilviucatalin";
          _validateDropDown16 = false;
          debugPrint('valoare email: $_recipientController16');
        }
        break;
      case "Telefon":
        {
          _recipientController16 = "tel://0736655521";
          _validateDropDown16 = false;
          debugPrint('valoare email: $_recipientController16');
        }
        break;
    }
  }

  //17
  void dropDownValueIdentifier17(value) {
    switch (value) {
      case "Platforma de contact":
        {
          _recipientController17 = null;
          _validateDropDown17 = true;
          debugPrint('valoare email: $_recipientController17');
        }
        break;
      case "Email":
        {
          _recipientController17 = "mailto:wernertiron@yahoo.com";
          _validateDropDown17 = false;
          debugPrint('valoare email: $_recipientController17');
        }
        break;
      case "Telefon":
        {
          _recipientController17 = "tel://0742766042";
          _validateDropDown17 = false;
          debugPrint('valoare email: $_recipientController17');
        }
        break;
    }
  }
}
