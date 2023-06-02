import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';

class LeaderCard extends StatelessWidget with GetImageUrl, UrlLauncher {
  final String? name;
  final String? wealth;
  final String? interests;
  final String? email;
  final String? urlFb;
  final String? function;
  final String? urlImg;
  final String? location;

  const LeaderCard({
    super.key,
    this.name,
    this.wealth,
    this.interests,
    this.email,
    this.urlFb,
    this.function,
    this.urlImg,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Futuristic(
                  initialBuilder: (_, __) => Container(),
                  futureBuilder: () => getImageUrl(urlImg!),
                  dataBuilder: (_, snapshot) => ImageWidget(
                        link: snapshot as String,
                        width: Get.width / 3,
                        height: 200,
                      )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '$function'.toLowerCase().tr,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: const Icon(Entypo.facebook),
                      onTap: () async {
                        await launchUrlS(urlFb!);
                      },
                    ),
                    email != null
                        ? InkWell(
                            child: const Icon(Entypo.mail),
                            onTap: () async {
                              final Uri emailUri =
                                  Uri(scheme: 'mailto', path: email);
                              await launchUrlUri(emailUri);
                            },
                          )
                        : Container(),
                  ],
                ),
                Text(
                  'additional-information'.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                InkWell(
                  onTap: () async {
                    await launchUrlS(wealth!);
                  },
                  child: Text(
                    'wealth-declaration'.tr,
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await launchUrlS(interests!);
                  },
                  child: Text(
                    'declaration-interests'.tr,
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
