import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class TaxiItem extends StatelessWidget with UrlLauncher {
  final String phone;
  final String url;
  final String plate;
  final String car;
  final String driver;

  const TaxiItem({
    super.key,
    required this.phone,
    required this.url,
    required this.plate,
    required this.car,
    required this.driver,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                url,
                scale: 1.0,
                fit: BoxFit.fitWidth,
                height: 200,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Entypo.user,
                      size: 17,
                    ),
                  ),
                  Text(
                    '$driver',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      FontAwesome5.car,
                      size: 17,
                    ),
                  ),
                  Text('$car'),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Entypo.vcard,
                      size: 17,
                    ),
                  ),
                  Text('$plate'),
                ],
              ),
              InkWell(
                onTap: () async => await launchUrlS('tel://$phone'),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Entypo.phone,
                        color: Colors.blue,
                        size: 17,
                      ),
                    ),
                    Text(
                      '$phone',
                      style: const TextStyle(color: Colors.blue),
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
