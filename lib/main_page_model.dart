import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'widgets/src/nav_drawer.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.center,
          child: Text(
            'e-Rădăuți',
            style: TextStyle(
              color: Color(0xFF000000), //Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 0.0, right: 0.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size: 24,
                color: Colors.black,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ],
        leading: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
          child: new Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              new Image.asset(
                "assets/logo_images/app_logo.png", //Constant.iconNotification,
              ),
            ],
          ),
        ),
      ),
      drawer: NavDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: (MediaQuery.of(context).size.height - 250),
              child: Container(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(15),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio:
                      (MediaQuery.of(context).size.width / 2 - 22.5) /
                          (MediaQuery.of(context).size.height / 5 - 60),
                  children: <Widget>[
                    itemMenu(context, 'Sesizează o\nproblemă',
                        Icons.photo_filter, '/noticeProblem'),
                    itemMenu(context, 'Administrație \nlocală',
                        Icons.location_city, '/townHall'),
                    itemMenu(
                        context, 'Evenimente', Icons.calendar_today, '/events'),
                    itemMenu(context, 'Numere utile', Icons.perm_phone_msg,
                        '/numbers'),
                    itemMenu(context, 'Anunțuri', Icons.announcement, '/jobs'),
                    itemMenu(context, 'Calitatea Aerului', Icons.bubble_chart,
                        '/air'),
                    itemMenu(context, 'Transport', Icons.train, '/transport'),
                    itemMenu(context, 'Voluntariat',
                        FontAwesome5.hand_holding_heart, '/volunteer'),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: new InkWell(
                            child: new Text(
                              'Despre noi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Color(0xFF32325D),
                                fontSize: 15,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/about');
                            },
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                        ),
                        Container(
                          child: new InkWell(
                            child: new Text(
                              'Confidențialitate',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Color(0xFF32325D),
                                fontSize: 15,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/confidential',
                              );
                            },
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                        ),
                        Container(
                          child: new InkWell(
                            child: new Text(
                              'Contact',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Color(0xFF32325D),
                                fontSize: 15,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/contact');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: new InkWell(
                          child: new Text(
                            'Parteneri',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF32325D),
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/partner');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector itemMenu(context, title, icon, nextScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          nextScreen,
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 0),
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Color(0x55FB6340),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  color: Color(0xFF000000), //Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
