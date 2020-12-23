import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/appBarModel.dart';
import 'package:flutterapperadauti/menu_page.dart';

class Partner extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer2(),
      appBar: AppBarModel().loadAppBar(
          context, 'Parteneri', Icons.add_box_outlined, _scaffoldKey),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            // 1 FONDUL PENTRU DEMOCRATIE
            Container(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/fondul_pentru_democratie.png",
                    height: 100,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: Text(
                "Fondul pentru Democrație",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            //2 CODE4ROMANIA
            Container(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/code_4_romania.png",
                    width: MediaQuery.of(context).size.width - 50,
                    height: 100,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: Text(
                "Code4Romania",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            //3 HARD POWER RADAUTI
            Container(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/hard_power_radauti.png",
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: Text(
                "Hard Power Services Rădăuți",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
