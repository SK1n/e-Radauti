import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class LocalCouncil extends StatelessWidget {
  const LocalCouncil({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel().loadAppBar(
          context, 'Consiliul Local', Icons.location_city, _scaffoldKey),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        child:
                            SvgPicture.asset("assets/images/circle_194C80.svg"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 90,
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          "Consiliul Local",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width - 50,
                    child: Text(
                      "Lista cu consilierii locali. Contactează-ți reprezentantul.",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(
                        color: Color(0xFF38A49C),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            listItem(context, 'Airinei Cristina', 'AirineiCristina.jpg',
                'psd.png', '+40722458858', 'kristynn_a@yahoo.com'),
            listItem(context, 'Calenciuc Anca-Elena', 'CalenciucAnca.jpg',
                'pnl.png', '+40755098643', 'calenciuc_anca@yahoo.com'),
            listItem(context,'Doroșcan Florin-Constantin','DoroscanFlorin.jpg','pnl.png',
                '+40744848138',
                'fdoroscan@gmail.com'),
            listItem(context, 'Jecalo Adi Gheorghiță', 'JecaloAdi.jpg',
                'psd.png', '+40742427260', 'adijekalo@yahoo.com'),
            listItem(context, 'Luchian Constantin', 'LuchianConstantin.jpg',
                'pnl.png', '+40744508199', 'luchianct@gmail.com'),
            listItem(context, 'Martinescu Paul-Tudor', 'MartinescuPaul.jpg',
                'pnl.png', "+40745368184", 'paul.martinescu@yahoo.com'),
            listItem(context, 'Mitrofan Ionel', 'MitrofanIonel.jpg', 'psd.png',
                '+40723244490', 'ionel.mitrofan@yahoo.com'),
            listItem(context, 'Nanu Lucian-Mihai', 'NanuLucian.jpg', 'pmp.png',
                null, 'luciannanu@yahoo.com'),
            listItem(
                context,
                'Nichiforiuc Cristina-Nicoleta',
                'NichiforiucCristina.jpg',
                'pnl.png',
                null,
                'cristina_nichiforiuc@yahoo.com'),
            listItem(context, 'Nicolau Bogdan-Adrian', 'NicolauBogdan.jpg',
                'pmp.png', null, 'agentie@yahoo.com'),
            listItem(context, 'Olărean Aurel', 'OlareanAurel.jpg', 'per.jpg',
                null, 'olareanaurel2@gmail.com'),
            listItem(context, 'Onica Marius-Nicolae', 'OnicaMarius.jpg',
                'pnl.png', null, 'onica.marius@gmail.com'),
            listItem(context, 'Preda Florin-Mirel', 'PredaFlorin.jpg',
                'psd.png', '+40787886725', 'eu.consulting17@gmail.com'),
            listItem(context, 'Simota Gheorghe', 'SimotaGheorghe.jpg',
                'psd.png', '+40755149300', 'gheorghe_simota@yahoo.com'),
            listItem(context, 'Tătar Nistor', 'TatarNistor.jpg', 'psd.png',
                '+40736358130', 'nistor_tatar@yahoo.com'),
            listItem(
                context,
                'Tibeică Silviu-Cătălin',
                'TibeicaSilviu.jpg',
                'pnl.png',
                '+40736655521',
                'tibeica.silviu.catalin@protonmail.com'),
            listItem(context, 'Tiron Werner', 'TironWerner.jpg', 'pnl.png',
                '+40742766042', 'wernertiron@yahoo.com'),
            listItem(context, 'Țarevici Cezar-Ciprian', 'TareviciCezar.jpg',
                'pnl.png', null, 'tarevici.ciprian@yahoo.com'),
            listItem(context, 'Vasiloschi Iulian-Teodor',
                'VasiloschiIulian.jpg', 'psd.png', '+40752336791', 'ivasiloschi@yahoo.com'),
          ],
        ),
      ),
    );
  }

  Card listItem(context, name, avatar, squareImg, phone, email) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage("assets/images/council/$avatar"),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                height: 50,
                                width: 50,
                                child: Image.asset("assets/images/$squareImg"),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "$name",
                                        style: TextStyle(
                                            color: Color(0xFF38A49C),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "Consilier Local",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                              color: Color(0xFF38A49C),
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              splashColor: Color(0x8838A49C),
                              onPressed: phone == null
                                  ? null
                                  : () {
                                      UrlLauncher.launch('tel://$phone');
                                    },
                              child: Text(
                                "Telefon",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                          ),
                          Expanded(
                            child: FlatButton(
                              color: Color(0xFF38A49C),
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              splashColor: Color(0x8838A49C),
                              onPressed: email == null
                                  ? null
                                  : () {
                                      UrlLauncher.launch('mailto:$email');
                                    },
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
