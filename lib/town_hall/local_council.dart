import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutterapperadauti/menu_page.dart';

class LocalCouncil extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget addLeadingIcon(){
    return new Container(
      //height: 110.0, //50.0, //25.0,
      //width: 110.0, //50.0, //25.0,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), //EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0), //EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0), //const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
            Container(
              padding: EdgeInsets.only(bottom: 15, top: 20),
              child: Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      //YourScrollViewWidget(),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFF979797),), //_left Icons.arrow_back
                        onPressed: (){
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
                        child: SvgPicture.asset("assets/images/circle_194C80.svg"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 90,
                        padding: EdgeInsets.only(left: 10,),
                        child: Text(
                          "Consiliul Local 2016-2020",
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
              padding:EdgeInsets.symmetric(horizontal:15.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/CovaliTiberiu.png"),
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
                                "Covali Tiberiu",
                                style: TextStyle(
                                  color: Color(0xFF38A49C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21
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
                                "Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură",
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
                              width: MediaQuery.of(context).size.width -136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                      child: new Text(
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Covaliu-Tiberiu.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Covaliu-Tiberiu-1.pdf')
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
                      },
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
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: null,//AssetImage("assets/images/ChitriucIlie.png"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/alde.png"),
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
                                "Chitriuc Ilie",
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
                                  "Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Chitruc-Ilie.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Chitriuc-Ilie.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                      },
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
            //2
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/CarcaletePetru.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/alde.png"),
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
                                "Carcalete Petru",
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
                                "Comisia pentru activități social-culturale, culte, învățământ, sănătate, familie, muncă, protecție socială, sport și agrement, protecție copii, tineret",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Carcalete-Petru.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Carcalete-Petru-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                      onPressed: () {
                      },
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
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/CojocarVasile.jpg"),
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
                                "Cojocar Vasile Codruțu",
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
                                "Comisia pentru administrație publică locală, juridică și disciplină, apararea ordinii publice, respectarea drepturilor și libertăților cetățenești",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Cojocar-Vasile-Codrutu.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Cojocar-Vasile-Codrutu-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                      onPressed: () {
                        //UrlLauncher.launch("mailto:registratura@primarie.ro");
                      },
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
            //3
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/GrijincuMarius.jpg"),
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
                                "Grijincu Marius Costel",
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
                                "- Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură \n"
                                +
                                "- Comisia pentru activități social-culturale, culte, învățământ, sănătate, familie, muncă, protecție socială, sport și agrement, protecție copii, tineret",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Grijincu-Marius-Costel.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Grijincu-Marius.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                        //UrlLauncher.launch("mailto:registratura@primarie.ro");
                      },
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
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/JecaloAdi.jpg"),
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
                                "- Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură \n"
                                +
                                "- Comisia pentru administrație publică locală, juridică și disciplină, apararea ordinii publice, respectarea drepturilor și libertăților cetățenești",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Jecalo-Gheorghita.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Jecalo-Gheorghita-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                      },
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
            //4
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: null, //AssetImage("assets/images/HacmanMircea.png"),
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
                                "Hacman Mircea Cozma",
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
                                "Comisia pentru administrație publică locală, juridică și disciplină, apararea ordinii publice, respectarea drepturilor și libertăților cetățenești",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Hacman-Mircea.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Hacman-Mircea-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                      },
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
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/MehedinMaria.png"),
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
                                "Mehedin Maria",
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
                                  "Comisia pentru administrație publică locală, juridică și disciplină, apararea ordinii publice, respectarea drepturilor și libertăților cetățenești",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Mehedin-Maria.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Mehedin-Maria-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                      },
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
            //5
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/MironCatalin.jpg"),
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
                                "Miron Cătălin",
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
                                "Comisia pentru administrație publică locală, juridică și disciplină, apararea ordinii publice, respectarea drepturilor și libertăților cetățenești",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Miron-Catalin.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Miron-Catalin-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                      },
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
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: null, //AssetImage("assets/images/PopescuAngelica.png"),
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
                                "Popescu Angelica",
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
                                "Comisia pentru activități social-culturale, culte, învățământ, sănătate, familie, muncă, protecție socială, sport și agrement, protecție copii, tineret",
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
                              width: MediaQuery.of(context).size.width -136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                      child: new Text(
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Popescu-Angelica.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Popescu-Angelica-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                      },
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
            //6
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/MutrescuDan.jpg"),
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
                                "Mutrescu Dan",
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
                                "Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură",
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
                              width: MediaQuery.of(context).size.width -136,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new InkWell(
                                      child: new Text(
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Mutrescu-Dan.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Mutrescu-Dan-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                      },
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
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/NegrutRomeo.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/upr.jpg"),
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
                                "Negruț Romeo",
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
                                  "- Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură \n"
                                  +
                                  "- Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Negrut-Catalin-Romeo.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Negrut-Romeo.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                      },
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
            //7
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/NicolauBogdan.jpg"),
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
                                "Nicolau Bogdan Adrian",
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
                                "Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Nicolau-Bogdan.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Nicolau-Bogdan-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                        //UrlLauncher.launch("mailto:registratura@primarie.ro");
                      },
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
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/PredaFlorin.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/alde.png"),
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
                                "Preda Florin Mirel",
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
                                "Comisia pentru activități social-culturale, culte, învățământ, sănătate, familie, muncă, protecție socială, sport și agrement, protecție copii, tineret",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Preda-Florin.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Preda-Florin-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                        //UrlLauncher.launch("mailto:registratura@primarie.ro");
                      },
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
            //8
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: null, //AssetImage("assets/images/RemanMihai.jpg"),
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
                                "Colibaba Marcel",
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
                                        'Declariație de avere',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        //style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C),),
                                      ),
                                      //onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Covaliu-Tiberiu.pdf')
                                    onTap: null,//() {}
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
                                      onTap: null,//() {}
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
                    padding: EdgeInsets.only(top: 10,),
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
                        //UrlLauncher.launch("mailto:registratura@primarie.ro");
                      },
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
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/RobuSorin.jpg"),
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
                                "Robu  Sorin",
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
                                "Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Robu-Sorin.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Robu-Sorin-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                        //UrlLauncher.launch("mailto:registratura@primarie.ro");
                      },
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
            //9
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/SimotaGheorghe.jpg"),
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
                                "- Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură\n"
                                +
                                "- Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Simota-Gheorghe.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Simota-Gheorghe-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                        //UrlLauncher.launch("mailto:registratura@primarie.ro");
                      },
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
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 20),
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
                              backgroundImage: AssetImage("assets/images/TereviciCezar.jpg"),
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
                                "Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Tarevici-Cezar-Ciprian.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Tarevici-Ciprian.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                      },
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
            //10
            Container(
              padding: EdgeInsets.only(left: 17, right: 17,top: 20, bottom: 30),
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
                              backgroundImage: AssetImage("assets/images/VatraDan.jpg"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/upr.jpg"),
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
                                "Vatră Dan",
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
                                "Comisia pentru activități social-culturale, culte, învățământ, sănătate, familie, muncă, protecție socială, sport și agrement, protecție copii, tineret",
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
                                        'Declariație de avere',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Dan-Vatra.pdf')
                                  ),
                                  new InkWell(
                                      child: new Text(
                                        'Declarație de interese',
                                        style: TextStyle(decoration: TextDecoration.underline, color: Color(0xFF38A49C), fontSize: 15,),
                                      ),
                                      onTap: () => UrlLauncher.launch('https://primariaradauti.ro/wp-content/uploads/2020/07/Dan-Vatra-1.pdf')
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
                    padding: EdgeInsets.only(top: 10,),
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
                        //UrlLauncher.launch("mailto:registratura@primarie.ro");
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
}