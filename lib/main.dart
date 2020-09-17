import 'package:flutter/material.dart';
import 'package:flutterapperadauti/jobs/main_page_jobs.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutterapperadauti/TownHall/town_hall_main.dart';
import 'package:flutterapperadauti/notice_a_problem/main_page.dart';
import 'package:flutterapperadauti/usefull_numbers/main_page.dart';
import 'package:flutterapperadauti/events/main.dart';
import 'package:flutterapperadauti/usefull_pages/partner.dart';
import 'package:flutterapperadauti/usefull_pages/credits.dart';
import 'package:flutterapperadauti/usefull_pages/contact.dart';
import 'package:flutterapperadauti/usefull_pages/confidential.dart';
import 'package:flutterapperadauti/usefull_pages/about_us_main.dart';

void main() {
  runApp(MyAppRC());
}

class MyAppRC extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Rădăuți',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFFFFFF),
      ),
      home: AndroidMobile1(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new AndroidMobile1(),
      title: new Text(
        'Aplicația e-Rădăuți',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.black,
        ),
      ),
      image: Image.asset("assets/logo_images/app_logo.png"),
      backgroundColor: Colors.white,
      photoSize: 80.0,
    );
  }
}

class AndroidMobile1 extends StatelessWidget {
  AndroidMobile1({
    Key key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90, //(MediaQuery.of(context).size.height/5 - 45),
              child: Container(
                //padding: EdgeInsets.only(top: 12.5, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/images/birthday.png"),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      //width: MediaQuery.of(context).size.width - 101,
                      child: Text(
                        "Bun venit!",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: (MediaQuery.of(context).size.height - 270),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageNoticeProblem()),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.photo_filter,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2 -
                                    97, //150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: Text(
                                    'Sesizează o problemă',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(
                                      color: Color(
                                          0xFF000000), //Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TownHallMain()),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.location_city,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Administrație \nlocală',
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
                    ),
                    //2
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EventsMain()),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Evenimente',
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageNumbers()),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.perm_phone_msg,
                                color: Color(0x55FB6340),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Numere utile',
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
                    ),
                    //3
                    GestureDetector(
                      onTap: null,
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                color: Color(0xAAC4C4C4),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2 -
                                    77, //150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text: 'Reciclare\n',
                                          style: TextStyle(
                                            color: Color(
                                                0xFF979797), //Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        new TextSpan(
                                          text: 'Coming soon',
                                          style: TextStyle(
                                            color: Color(
                                                0xFFC4C4C4), //Color(0xFFFFFFFF),
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 14,
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageJobs(),
                            ));
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                color: Color(0xAAC4C4C4),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2 -
                                    77, //150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text: 'Joburi\n',
                                          style: TextStyle(
                                            color: Color(
                                                0xFF979797), //Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        new TextSpan(
                                          text: 'Coming soon',
                                          style: TextStyle(
                                            color: Color(
                                                0xFFC4C4C4), //Color(0xFFFFFFFF),
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 14,
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
                    ),
                    //4
                    GestureDetector(
                      onTap: null,
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                color: Color(0xAAC4C4C4),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2 -
                                    77, //150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text: 'Voluntariat\n',
                                          style: TextStyle(
                                            color: Color(
                                                0xFF979797), //Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        new TextSpan(
                                          text: 'Coming soon',
                                          style: TextStyle(
                                            color: Color(
                                                0xFFC4C4C4), //Color(0xFFFFFFFF),
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 14,
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
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              0), //const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                color: Color(0xAAC4C4C4),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2 -
                                    77, //150,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 0.0), //10.0 //25.0
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text: 'Transport\n',
                                          style: TextStyle(
                                            color: Color(
                                                0xFF979797), //Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        new TextSpan(
                                          text: 'Coming soon',
                                          style: TextStyle(
                                            color: Color(
                                                0xFFC4C4C4), //Color(0xFFFFFFFF),
                                            fontSize: 14,
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90, //(MediaQuery.of(context).size.height/5 - 45),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //1
                    Container(
                      //padding: EdgeInsets.only(left: 0, right: 5,),
                      width: MediaQuery.of(context).size.width / 5 - 5,
                      child: new InkWell(
                        child: new Text(
                          'Despre noi',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF38A49C),
                            fontSize: 15,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutUsMain()),
                          );
                        },
                      ),
                    ),
                    //2
                    Container(
                      //padding: EdgeInsets.only(left: 0, right: 5,),
                      width: MediaQuery.of(context).size.width / 5 + 35,
                      child: new InkWell(
                        child: new Text(
                          'Confidențialitate',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF38A49C),
                            fontSize: 15,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Confidential()),
                          );
                        },
                      ),
                    ),
                    //3
                    Container(
                      //padding: EdgeInsets.only(left: 0, right: 5,),
                      width: MediaQuery.of(context).size.width / 5 - 15,
                      child: new InkWell(
                        child: new Text(
                          'Contact',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF38A49C),
                            fontSize: 15,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Contact2()),
                          );
                        },
                      ),
                    ),
                    //4
                    Container(
                      //padding: EdgeInsets.only(left: 0, right: 0,),
                      width: MediaQuery.of(context).size.width / 5 - 15,
                      child: new InkWell(
                        child: new Text(
                          'Credits',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF38A49C),
                            fontSize: 15,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Credits()),
                          );
                        },
                      ),
                    ),
                    //5
                    Container(
                      //padding: EdgeInsets.only(left: 5, right: 5,),
                      width: MediaQuery.of(context).size.width / 5 - 15,
                      child: new InkWell(
                        child: new Text(
                          'Parteneri',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF38A49C),
                            fontSize: 15,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Partner()),
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
    );
  }
}
