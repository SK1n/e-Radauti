import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/transport/models/taxi_model.dart';
import 'package:flutterapperadauti/widgets/src/appBarModelNew.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Taxi extends StatefulWidget {
  Taxi({Key key}) : super(key: key);

  @override
  State<Taxi> createState() => _TaxiState();
}

class _TaxiState extends State<Taxi> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    FetchTaxiData data = Provider.of<FetchTaxiData>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
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
        body: FutureBuilder(
            future: data.getTaxiFromFirebase(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.hasError) {
                return Text('A aparut o eroare');
              }
              if (snap.hasData) {
                return ListView.builder(
                    itemCount: data.getLength(),
                    itemBuilder: (BuildContext context, int item) {
                      return listItem(
                        url: snap.data[item].url,
                        driver: snap.data[item].driverName,
                        phone: snap.data[item].phoneNumber,
                        car: snap.data[item].car,
                        plate: snap.data[item].plateNumber,
                      );
                    });
              } else {
                return LoadingScreen();
              }
            }),
      ),
    );
  }

  Future getDownloadUrlFromUrlRef(BuildContext context, String imgURL) async {
    Image image;
    await FirebaseStorage.instance
        .refFromURL(imgURL)
        .getDownloadURL()
        .then((imageUrl) => image = Image.network(
              imageUrl.toString(),
            ));
    return image;
  }

  Card listItem({
    String phone,
    String url,
    String plate,
    String car,
    String driver,
  }) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
                height: 100,
                width: 100,
                child: FutureBuilder(
                  future: getDownloadUrlFromUrlRef(context, url),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasError) {
                      return Text('Nu am putut incarca imaginea');
                    }
                    if (snap.hasData) {
                      return snap.data;
                    } else {
                      return LoadingScreen();
                    }
                  },
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      AntDesign.user,
                      size: 17,
                    ),
                  ),
                  Text(
                    '$driver',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      AntDesign.car,
                      size: 17,
                    ),
                  ),
                  Text('$car'),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      AntDesign.idcard,
                      size: 17,
                    ),
                  ),
                  Text('$plate'),
                ],
              ),
              InkWell(
                onTap: () {
                  UrlLauncher.launch("tel://$phone");
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        AntDesign.phone,
                        color: Colors.blue,
                        size: 17,
                      ),
                    ),
                    Text(
                      '$phone',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
