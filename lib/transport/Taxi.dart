import 'package:flutter/material.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Taxi2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Rădăuți',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFFFFFFFF),
      ),
      home: Taxi(),
    );
  }
}

class Taxi extends StatelessWidget {
  Taxi({
    Key key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppBarUiSliver(
              content: 'Taximetriști',
              leading: Icons.local_taxi,
              scaffoldKey: _scaffoldKey,
            )
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      listItem(
                          '0752436011',
                          'assets/images/Taxi/SV14PLS_png.png',
                          'ASURDOAIEI IONUȚ',
                          'SV-14PLS',
                          'DACIA LOGAN'),
                      listItem(
                          '0774507799',
                          'assets/images/Taxi/SV65LEV_png.png',
                          'BĂNCESCU CRISTI',
                          'SV-65LEV',
                          'SEAT IBIZA'),
                      listItem('0740348225', 'assets/images/Taxi/SV12NLJ.png',
                          'BOICU COSTICĂ', 'SV-12NLJ', 'DACIA LOGAN'),
                      listItem('0745629388', 'assets/images/Taxi/SV05JFR.png',
                          'BOȘTIOG ADRIAN', 'SV-05JFR', 'DACIA LOGAN'),
                      listItem(
                          '0720217728',
                          'assets/images/Taxi/SV51LIE_png.png',
                          'BUCEVSCHI ILIE',
                          'SV-51LIE',
                          'VOLKSWAGEN'),
                      listItem('0742041403', 'assets/images/Taxi/SV27COV.png',
                          'COVAȘĂ SORIN', 'SV-27COV', 'DACIA LOGAN'),
                      listItem('0766210240', 'assets/images/Taxi/SV13NOC.png',
                          'DIACONESCU FLORIN', 'SV-13NOC', 'VW TOURAN (CREM)'),
                      listItem(
                          '0740593510',
                          'assets/images/Taxi/SV11NEL_png.png',
                          'GRAB IOAN',
                          'SV-11NEL',
                          'MERCEDES-BENZ E-CLASS'),
                      listItem(
                          '0741283879',
                          'assets/images/Taxi/SV62LAZ_png.png',
                          'LAZĂR GHEORGHE',
                          'SV-62LAZ',
                          'DACIA SANDERO'),
                      listItem(
                          '0742161708',
                          'assets/images/Taxi/SV12TWL_png.png',
                          'MIHALESCU TONI',
                          'SV-12TWL',
                          'DACIA LOGAN'),
                      listItem('0744622405', 'assets/images/Taxi/SV74MSV.png',
                          'PASLARIU MIHAI', 'SV-74MSV', 'VOLKSWAGEN'),
                      listItem('0741697725', 'assets/images/Taxi/SV21PCR.png',
                          'PESCLEVEI RADU', 'SV-21PCR', 'DACIA DOKKER'),
                      listItem('0754554488', 'assets/images/Taxi/SV01LMM.png',
                          'ROSE TAXI', 'SV-01LMM', 'DACIA LOGAN'),
                      listItem('0745536280', 'assets/images/Taxi/SV04PNZ.png',
                          'TIPERCIUC VASILE', 'SV-04PNZ', 'DACIA LOGAN'),
                      listItem(
                          '0745683668',
                          'assets/images/Taxi/SV16TOD_png.png',
                          'TODERAȘ VIOREL',
                          'SV-16TOD',
                          'VOLSKWAGEN PASSAT'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector listItem(phoneNumber, path, name, plateNumber, carType) {
    return GestureDetector(
      onTap: () {
        UrlLauncher.launch("tel://$phoneNumber");
      },
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                      height: 100, width: 100, child: Image.asset('$path')),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text(
                          '$name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('$carType'),
                        Text('$plateNumber'),
                        Text('$phoneNumber')
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
