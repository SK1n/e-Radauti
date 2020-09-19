import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10,),
            width: MediaQuery.of(context).size.width - 30,
            child: Image.asset(
              "assets/images/coperta_hai_sa_digitalizam.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 30,
            padding: EdgeInsets.only(top: 20,),
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
            padding: EdgeInsets.only(top: 10,),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Aplicația „e-Rădăuți” este un proiect voluntar născut în 2017 din dorința de a duce orașul '
              +
              'mai aproape de era digitală, de a facilita accesul localnicilor și a turiștilor la '
              +
              'resurselor culturale ale orașului și de implicare în acțiunile locale.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //2
          Container(
            padding: EdgeInsets.only(top: 10,),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Aplicația s-a născut în urma unui concurs în premieră în '
              +
              'oraș intitulat „Hai să digitalizăm orașul” în care au participat optsprezece '
              +
              'elevi din două licee din Rădăuți.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //3
          Container(
            padding: EdgeInsets.only(top: 10,),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Aplicațiile dezvoltate în timpul concursului au fost evaluate de un juriu internațional '
              +
              'de profesioniști în domeniul IT și Design iar resursele financiare pentru premii '
              +
              'au fost provenite din donații ale membrilor „Rădăuțiul civic”, ale juriului și ale '
              +
              'firmei locale „Hard Power Services”.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //4
          Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Noua versiune a aplicației e-Rădăuți este implementată în anul 2020 cu ajutorul fondurilor obținute '
              +
              'de la asociația Geeks for Democracy, prin Fondul pentru Democrație și este dedicată doar '
              +
              'localnicilor, renunțând temporar la partea dedicată turiștilor.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //5
          Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'De asemenea această versiunea se bazează și pe sprijinul oferit de Code4Romania, în cadrul '
              +
              'ședințelor tehnice Civic Tech 911, în care ne-au oferit sprijin cum să organizăm layout și alte '
              +
              'aspecte tehnice.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //6
          Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Acest upgrade a venit cu noi funcționalități dar și cu îmbunătățiri ale funcționalităților deja '
              +
              'existente, aplicația fiind disponibilă în premieră și pe iOS, nu doar pe Android.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          //7
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 20,),
            width: MediaQuery.of(context).size.width - 30,
            child: Text(
              'Aplicația este rezultatul muncii unei echipe formate din Ciprian Dicu, Luis Scripcaru, '
              +
              'Paul Coman - pe partea de dezvoltare, cod și algoritmi, Viviana Huțuleac și '
              +
              'Daniela Tiron pe partea de comunicare și grafică și Luca Ciubotaru pe partea de management de '
              +
              'proiect.',
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