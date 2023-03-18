import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';

class UsefullNumbersWidget extends StatelessWidget with UrlLauncher {
  final String? title;
  final List<dynamic>? phone;
  final List<dynamic>? email;
  const UsefullNumbersWidget({
    super.key,
    required this.title,
    this.phone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!.toLowerCase().replaceAll(" ", "-").tr,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const Divider(
              height: 20,
              thickness: 2,
            ),
            phone != null
                ? ListView.builder(
                    itemCount: phone!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int item) {
                      return Column(
                        children: [
                          ListTile(
                            leading: const Icon(Entypo.phone),
                            title: Text('${phone![item]}'),
                            onTap: () async {
                              await launchUrlS('tel:${phone![item]}');
                            },
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                          ),
                        ],
                      );
                    })
                : Container(),
            email != null
                ? ListView.builder(
                    itemCount: email!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int item) {
                      return Column(
                        children: [
                          ListTile(
                            leading: const Icon(Entypo.mail),
                            title: Text('${email![item]}'),
                            onTap: () async {
                              await launchUrlS('mailto:${email![item]}');
                            },
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                          ),
                        ],
                      );
                    })
                : Container(),
          ],
        ),
      ),
    );
  }
}
