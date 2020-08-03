import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LocalCouncil extends StatelessWidget {

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
      appBar: AppBar(
        title: const Text('E-Radauti'),
        backgroundColor: Color.fromARGB(255, 54, 190, 166),
        actions: <Widget>[
        ],
        leading: addLeadingIcon(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        child: FlatButton(
                          child: SvgPicture.asset("assets/images/circle_194C80.svg"),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width-80,
                            child: Text(
                              "Consiliul Local",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            child: Text(
                                "Consilieri locali și atribuțiile lor.\nContactează-ți reprezentantul.",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Covali Tiberiu",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                "Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                        "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Chitriuc Ilie",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            //2
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Carcalete Petru",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru activități social-culturale, culte, învățământ, sănătate, familie, muncă, protecție socială, sport și agrement, protecție copii, tineret"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Cojocar Vasile Codruțu",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru administrație publică locală, juridică și disciplină, apararea ordinii publice, respectarea drepturilor și libertăților cetățenești"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            //3
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Grijincu Marius Costel",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "- Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură \n"
                                  +
                                  "- Comisia pentru activități social-culturale, culte, învățământ, sănătate, familie, muncă, protecție socială, sport și agrement, protecție copii, tineret"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Jecalo Adi Gheorghiță",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "- Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură \n"
                                  +
                                  "- Comisia pentru administrație publică locală, juridică și disciplină, apararea ordinii publice, respectarea drepturilor și libertăților cetățenești"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            //4
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Hacman Mircea Cozma",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru administrație publică locală, juridică și disciplină, apararea ordinii publice, respectarea drepturilor și libertăților cetățenești"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Mehedin Maria",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru administrație publică locală, juridică și disciplină, apararea ordinii publice, respectarea drepturilor și libertăților cetățenești"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            //5
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Miron Cătălin",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru administrație publică locală, juridică și disciplină, apararea ordinii publice, respectarea drepturilor și libertăților cetățenești"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Popescu Angelica",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru activități social-culturale, culte, învățământ, sănătate, familie, muncă, protecție socială, sport și agrement, protecție copii, tineret"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            //6
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Mutrescu Dan",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Negruț Romeo",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "- Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură \n"
                                  +
                                  "- Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            //7
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Nicolau Bogdan Adrian",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Preda Florin Mirel",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru activități social-culturale, culte, învățământ, sănătate, familie, muncă, protecție socială, sport și agrement, protecție copii, tineret"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            //8
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Colibaba Marcel",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  ""
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Robu  Sorin",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            //9
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Simota Gheorghe",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "- Comisia pentru programe de dezvoltare economico-socială, buget, finanțe, administrarea domeniului public și privat al municipiului, servicii, comerț și agricultură\n"
                                  +
                                  "- Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Tarevici Cezar-Ciprian",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru amenajarea teritoriului și urbanism, realizarea lucrărilor publice, protecția mediului și turism, conservarea monumentelor istorice și de arhitectură"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:1.0,
                color:Color.fromRGBO(0, 0, 0, 0.1),),),
            //10
            Container(
              padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Vatră Dan",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 101,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "Consilier Local"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Comisii",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Comisia pentru activități social-culturale, culte, învățământ, sănătate, familie, muncă, protecție socială, sport și agrement, protecție copii, tineret"
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              width: MediaQuery.of(context).size.width - 101,
                              child: Text(
                                "Informații adiționale",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width -101,
                              child: Text(
                                  "Declariație de avere. \nDeclarație de interese"
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      child: Text(
                          "Contactează"
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
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