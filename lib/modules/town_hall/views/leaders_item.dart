import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/leaders/leaders_item_model.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';

class LeaderCard extends StatelessWidget with UrlLauncher {
  final LeadersItemModel item;

  const LeaderCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              link: item.urlImg,
              width: Get.width / 3,
              height: 200,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${item.function}'.toLowerCase().tr,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: const Icon(Entypo.facebook),
                      onTap: () async {
                        await launchUrlS(item.urlFb!);
                      },
                    ),
                    item.email != null
                        ? InkWell(
                            child: const Icon(Entypo.mail),
                            onTap: () async {
                              final Uri emailUri =
                                  Uri(scheme: 'mailto', path: item.email);
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
                    await launchUrlS(item.wealth!);
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
                    await launchUrlS(item.interests!);
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
