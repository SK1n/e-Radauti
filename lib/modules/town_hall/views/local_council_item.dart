import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_council/local_council_item_model.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:get/get.dart';

class LocalCouncilCard extends StatelessWidget with UrlLauncher {
  final LocalCouncilItemModel item;
  const LocalCouncilCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(
            link: item.url,
            width: 100,
            height: 150,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: Text(
                            item.function!
                                .toLowerCase()
                                .replaceAll(" ", "-")
                                .tr,
                          ),
                        ),
                        item.phoneNumber != null
                            ? SizedBox(
                                height: 20,
                                child: InkWell(
                                  onTap: () async {
                                    await launchUrlS('tel:${item.phoneNumber}');
                                  },
                                  child: Text(
                                    '${"tel".tr}: ${item.phoneNumber}',
                                    style: const TextStyle(
                                        color: Colors.blueAccent),
                                  ),
                                ),
                              )
                            : Container(),
                        InkWell(
                          onTap: () async {
                            await launchUrlS('mailto:${item.email}');
                          },
                          child: SizedBox(
                            width: Get.width - 110,
                            child: Text(
                              '${item.email}',
                              style: const TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/${item.party}.png',
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
