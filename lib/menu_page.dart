import 'package:flutter/material.dart';
import 'package:flutterapperadauti/town_hall/town_hall_main.dart';
import 'package:flutterapperadauti/notice_a_problem/main_page.dart';
import 'package:flutterapperadauti/usefull_numbers/main_page.dart';
import 'package:flutterapperadauti/events/main.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}

class NavDrawer2 extends StatelessWidget {
  Widget addDrawerHeaderIcon(){
    return new Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
      child: new Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          new Image.asset(
            "assets/logo_images/app_logo.png",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: addDrawerHeaderIcon(),
          ),
          ListTile(
            leading: Icon(Icons.photo_filter, color: Color(0x55FB6340),), //Icon(Icons.input),
            title: Text('Sesizează o problemă'), //Text('Welcome'),
            //onTap: () => {},
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageNoticeProblem()),);},
          ),
          ListTile(
            leading: Icon(Icons.location_city, color: Color(0x55FB6340),), //Icon(Icons.verified_user),
            title: Text('Administrație locală'), //Text('Profile'),
            //onTap: () => {Navigator.of(context).pop()},
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => TownHallMain()),);},
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: Color(0x55FB6340),), //Icon(Icons.settings),
            title: Text('Evenimente'), //Text('Settings'),
            //onTap: () => {Navigator.of(context).pop()},
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EventsMain()),);},
          ),
          ListTile(
            leading: Icon(Icons.perm_phone_msg, color: Color(0x55FB6340),), //Icon(Icons.border_color),
            title: Text('Numere utile'), //Text('Feedback'),
            //onTap: () => {Navigator.of(context).pop()},
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageNumbers()),);},
          ),
          ListTile(
            leading: Icon(Icons.access_time, color: Color(0xAAC4C4C4),),//Icon(Icons.cached, color: Color(0xAAFB6340),), //Icon(Icons.exit_to_app),
            title: new RichText(
              text: new TextSpan(
                children: [
                  new TextSpan(
                    text: 'Reciclare\n',
                    style: TextStyle(
                      color: Color(0xFF979797), //Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      //fontSize: 16,
                    ),
                  ),
                  new TextSpan(
                    text: 'Coming soon',
                    style: TextStyle(
                      color: Color(0xFFC4C4C4), //Color(0xFFFFFFFF),
                      //fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ), //Text('Logout'),
            onTap: null, //() => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.access_time, color: Color(0xAAC4C4C4),), //Icon(Icons.settings),
            title: new RichText(
              text: new TextSpan(
                children: [
                  new TextSpan(
                    text: 'Joburi\n',
                    style: TextStyle(
                      color: Color(0xFF979797), //Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      //fontSize: 16,
                    ),
                  ),
                  new TextSpan(
                    text: 'Coming soon',
                    style: TextStyle(
                      color: Color(0xFFC4C4C4), //Color(0xFFFFFFFF),
                      //fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ), //Text('Evenimente'), //Text('Settings'),
            onTap: null,//() => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.access_time, color: Color(0xAAC4C4C4),), //Icon(Icons.border_color),
            title: new RichText(
              text: new TextSpan(
                children: [
                  new TextSpan(
                    text: 'Voluntariat\n',
                    style: TextStyle(
                      color: Color(0xFF979797), //Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      //fontSize: 16,
                    ),
                  ),
                  new TextSpan(
                    text: 'Coming soon',
                    style: TextStyle(
                      color: Color(0xFFC4C4C4), //Color(0xFFFFFFFF),
                      //fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ), //Text('Numere utile'), //Text('Feedback'),
            onTap: null,//() => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.access_time, color: Color(0xAAC4C4C4),), //Icon(Icons.exit_to_app),
            title: new RichText(
              text: new TextSpan(
                children: [
                  new TextSpan(
                    text: 'Transport\n',
                    style: TextStyle(
                      color: Color(0xFF979797), //Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      //fontSize: 16,
                    ),
                  ),
                  new TextSpan(
                    text: 'Coming soon',
                    style: TextStyle(
                      color: Color(0xFFC4C4C4), //Color(0xFFFFFFFF),
                      //fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ), //Text('Reciclare'), //Text('Logout'),
            onTap: null, //() => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}