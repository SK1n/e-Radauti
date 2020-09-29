import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/menu_page.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Leaders extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 15, top: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Color(0xFF979797),
                      ), //_left Icons.arrow_back
                      onPressed: () {
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
                            SvgPicture.asset("assets/images/circle_69E781.svg"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 90,
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          "Conducere",
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
                      "Informații despre primar, viceprimar și atribuțiile fiecăruia.",
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
                      Container(
                        height: 91,
                        width: 91,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/images/loghin.jpg"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Bogdan Loghin",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Primar \nMunicipiul Rădăuți",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                FlatButton(
                                  child: Icon(
                                    Ionicons.logo_facebook,
                                    color: Colors.indigo,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    _launchURL("https://www.facebook.com/BogdanLoghinPNL/");
                                  },
                                ),

                                FlatButton(
                                  child: Icon(
                                    Ionicons.ios_mail,
                                    color: Colors.orangeAccent,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    UrlLauncher.launch(
                                        "mailto:primar@primariaradauti.ro");
                                  },
                                ),
                              ],
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
                                        'Declariație de avere',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF38A49C),
                                          fontSize: 15,
                                        ),
                                      ),
                                      onTap: () => UrlLauncher.launch(
                                          'https://primariaradauti.ro/wp-content/uploads/2019/12/Loghin_Bogdan_Andrei..pdf')),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF38A49C),
                                          fontSize: 15,
                                        ),
                                      ),
                                      onTap: () => UrlLauncher.launch(
                                          'https://primariaradauti.ro/wp-content/uploads/2019/12/Loghin_Bogdan_Andrei.-1.pdf')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
                      Container(
                        height: 91,
                        width: 91,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/images/NicolauBogdan.jpg"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Bogdan Adrian Nicolau",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Viceprimar \nMunicipiul Rădăuți",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                FlatButton(
                                  child: Icon(
                                    Ionicons.logo_facebook,
                                    color: Colors.indigo,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    _launchURL("facebook.com");
                                  },
                                ),
/*                                FlatButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Ionicons.logo_whatsapp,
                                    color: Colors.green,
                                    size: 40,
                                  ),
                                ),*/
                                FlatButton(
                                  child: Icon(
                                    Ionicons.ios_mail,
                                    color: Colors.orangeAccent,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    UrlLauncher.launch(
                                        "mailto:email1@gmail.com");
                                  },
                                ),
                              ],
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
                                        'Declariație de avere',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF38A49C),
                                          fontSize: 15,
                                        ),
                                      ),
                                      onTap: () => UrlLauncher.launch(
                                          'https://primariaradauti.ro/wp-content/uploads/2020/07/Nicolau-Bogdan-2.pdf')),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF38A49C),
                                          fontSize: 15,
                                        ),
                                      ),
                                      onTap: () => UrlLauncher.launch(
                                          'https://primariaradauti.ro/wp-content/uploads/2020/07/Nicolau-Bogdan-1-1.pdf')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
                      Container(
                        height: 91,
                        width: 91,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/images/MarinicaSofroni.jpg"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Marinică Sofroni",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              width: MediaQuery.of(context).size.width - 136,
                              child: Text(
                                "Secretar \nMunicipiul Rădăuți",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                FlatButton(
                                  child: Icon(
                                    Ionicons.logo_facebook,
                                    color: Colors.indigo,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    _launchURL("https://www.facebook.com/sofroni.marinica");
                                  },
                                ),
/*                                FlatButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Ionicons.logo_whatsapp,
                                    color: Colors.green,
                                    size: 40,
                                  ),
                                ),*/
                                FlatButton(
                                  child: Icon(
                                    Ionicons.ios_mail,
                                    color: Colors.orangeAccent,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    UrlLauncher.launch(
                                        "mailto:secretar@primariaradauti.ro");
                                  },
                                ),
                              ],
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
                                        'Declariație de avere',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF38A49C),
                                          fontSize: 15,
                                        ),
                                      ),
                                      onTap: () => UrlLauncher.launch(
                                          'https://primariaradauti.ro/wp-content/uploads/2020/07/Sofroni-Marinica-2.pdf')),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xFF38A49C),
                                          fontSize: 15,
                                        ),
                                      ),
                                      onTap: () => UrlLauncher.launch(
                                          'https://primariaradauti.ro/wp-content/uploads/2020/07/Sofroni-Marinica-1-1.pdf')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
          ],
        ),
      ),
    );
  }
}
