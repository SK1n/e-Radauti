import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/usefull_pages/about_us_app.dart';
import 'package:flutterapperadauti/usefull_pages/about_us_content.dart';
import 'package:flutterapperadauti/usefull_pages/contact.dart';
import 'package:flutterapperadauti/menu_page.dart';

class AboutUsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          automaticallyImplyLeading: false,
          leading: Container(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
            child: Image.asset("assets/logo_images/app_logo.png"),
          ),
          bottom: TabBar(
            indicatorColor: Color(0xAA38A49C),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                  child: Text(
                    'DESPRE NOI',
                    style: TextStyle(
                      fontSize: 15.0,//12.0 //16.0 //14.0
                      fontWeight: FontWeight.bold,
                      //color: Color(0x99FFFFFF),
                    ),
                  ),
              ),
              Tab(
                  child: Text(
                    'DESPRE APLICAȚIE',
                    style: TextStyle(
                      fontSize: 15.0,//12.0 //16.0 //14.0
                      fontWeight: FontWeight.bold,
                      //color: Color(0x99FFFFFF),
                    ),
                  ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child:  Icon(Ionicons.ios_mail, color: Colors.white, size: 35,),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Contact2()),);},
        ),
        body: TabBarView(
          children: [
            //1
            AboutUsContent(),
            //2
            AboutUsApp(),
          ],
        ),
      ),
    );
  }
}