import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              ],
            ),
          ),
          Container(
            //padding: EdgeInsets.only(bottom: 30,),
            width: MediaQuery.of(context).size.width - 30,
            child: Image.asset(
              "assets/images/coperta_hai_sa_digitalizam.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 30,
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "Aplicația e-Rădăuți",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          //1
          Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Aplicația „e-Rădăuți” este un proiect voluntar născut din dorința de a duce orașul ' +
                  'mai aproape de era digitală, de a facilita accesul localnicilor și a turiștilor la ' +
                  'resurselor culturale ale orașului și de implicare în acțiunile locale.',
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //2
          Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Aplicația este rezultatul unui concurs în premieră în ' +
                  'oraș intitulat „Hai să digitalizăm orașul” în care au participat optsprezece ' +
                  'elevi din două licee din Rădăuți.',
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //3
          Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Aplicațiile dezvoltate în timpul concursului au fost evaluate de un juriu internațional ' +
                  'de profesioniști în domeniul IT și Design iar resursele financiare pentru premii ' +
                  'au fost provenite din donații ale membrilor „Rădăuțiul civic”, a juriului și a ' +
                  'firmei locale „Hard Power Services”.',
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //4
          Container(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 20,
            ),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'După concurs, cinci dintre elevii câștigători au continuat dezvoltarea aplicației „e-Rădăuți” ' +
                  'alături de un alt coleg voluntar. Echipa e-Rădăuți este alcătuită acum din șase elevi: ' +
                  'Leonard Bereholschi, Cosmin Dărăbăneanu, Luis Scripcaru, Mihai Pricob, Radu Bouaru, ' +
                  'Robert Pomohaci, și un coordonator de proiect mentorul Paul Coman.',
              overflow: TextOverflow.ellipsis,
              maxLines: 7,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
