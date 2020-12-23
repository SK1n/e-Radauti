import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapperadauti/notice_a_problem/layout_notice_a_problem.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutterapperadauti/air_quality/air_quality.dart';
import 'package:flutterapperadauti/jobs/main_page_jobs.dart';
import 'package:flutterapperadauti/town_hall/town_hall_main.dart';
import 'package:flutterapperadauti/transport/transport_main_page.dart';
import 'package:flutterapperadauti/usefull_numbers/main_page.dart';
import 'package:flutterapperadauti/volunteer/volunteer.dart';
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
  Widget addDrawerHeaderIcon() {
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
          generateListTile(context, Icons.photo_filter, 'Sesizează o problemă',
              LayoutNoticeProblem()),
          generateListTile(context, Icons.location_city, 'Administrație locală',
              TownHallMain()),
          generateListTile(
              context, Icons.calendar_today, 'Evenimente', EventsMain()),
          generateListTile(
              context, Icons.perm_phone_msg, 'Numere utile', HomePageNumbers()),
          generateListTile(
              context, Icons.announcement, 'Anunțuri', HomePageJobs()),
          generateListTile(context, Icons.bubble_chart, 'Calitatea aerului',
              AirQualityPage()),
          generateListTile(
              context, Icons.train, 'Transport', HomePageTransport()),
          generateListTile(context, FontAwesome5.hand_holding_heart,
              'Voluntariat', VolunteerPage()),
          generateListTile(context, Icons.info, 'Despre aplicatie', null),
        ],
      ),
    );
  }

  ListTile generateListTile(context, icon, title, following) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0x55FB6340),
      ),
      title: Text(title),
      onTap: () {
        if (following != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => following,
              ));
        } else {
          showAboutDialog(
              context: context,
              applicationName: 'e-Radauti',
              applicationVersion:
                  'Version: 2.1', //TODO after every update ypu should update the version number
              applicationIcon: Image.asset(
                'assets/logo_images/app_logo_final.png',
                width: 24,
                height: 24,
              ));
        }
      },
    );
  }
}
