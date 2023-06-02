import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:get/get.dart';

class LocalCouncilCard extends StatelessWidget with GetImageUrl, UrlLauncher {
  final String? url;
  final String? name;
  final String? function;
  final String? party;
  final String? phoneNumber;
  final String? email;
  const LocalCouncilCard({
    super.key,
    this.url,
    this.name,
    this.function,
    this.party,
    this.phoneNumber,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Futuristic(
            initialBuilder: (_, __) => Container(),
            futureBuilder: () => getImageUrl(url!),
            dataBuilder: (_, snapshot) => ImageWidget(
              link: snapshot as String,
              width: 100,
              height: 150,
            ),
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
                          name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: Text(
                            function!.toLowerCase().replaceAll(" ", "-").tr,
                          ),
                        ),
                        phoneNumber != null
                            ? SizedBox(
                                height: 20,
                                child: InkWell(
                                  onTap: () async {
                                    await launchUrlS('tel:$phoneNumber');
                                  },
                                  child: Text(
                                    '${"tel".tr}: $phoneNumber',
                                    style: const TextStyle(
                                        color: Colors.blueAccent),
                                  ),
                                ),
                              )
                            : Container(),
                        InkWell(
                          onTap: () async {
                            await launchUrlS('mailto:$email');
                          },
                          child: SizedBox(
                            width: Get.width - 110,
                            child: Text(
                              '$email',
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
                    'assets/images/$party.png',
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
