import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        leading: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 5.0),
          child: Image.asset("assets/logo_images/app_logo.png"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 10,
              ),
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
                            //Icon(Icons.location_city, color: Color(0x55FB6340), size: 30,),
                            Container(
                              child: Text(
                                'Credits',
                                style: TextStyle(
                                  color: Color(0xFF000000), //Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
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
              padding: EdgeInsets.only(
                top: 10,
              ),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                'Icons made by Vectors Market, Icon Pond, Freepik, DinosoftLabs, DinosoftLabs, ' +
                    'Pixel Buddha, Roundicons and Alfredo Hernandez from www..flaticon.com',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
