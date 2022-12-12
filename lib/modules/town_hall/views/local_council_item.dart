import 'package:auto_size_text/auto_size_text.dart';
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
      child: Stack(
        children: [
          Futuristic(
              futureBuilder: () => getImageUrl(url!),
              dataBuilder: (_, snap) => ImageWidget(
                    link: snap.data,
                    width: 100,
                    height: 150,
                  )),
          Positioned(
            left: 110,
            child: SizedBox(
              width: Get.width - 170,
              height: 50,
              child: AutoSizeText(
                name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 42,
            child: SizedBox(
              width: Get.width - 110,
              height: 20,
              child: AutoSizeText(
                function!.toLowerCase().replaceAll(" ", "-").tr,
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 60,
            child: phoneNumber != null
                ? SizedBox(
                    height: 20,
                    child: InkWell(
                      onTap: () async {
                        await launchUrl('tel:$phoneNumber');
                      },
                      child: Text(
                        '${"tel".tr}: $phoneNumber',
                        style: const TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  )
                : Container(),
          ),
          Positioned(
            left: 110,
            top: phoneNumber != null ? 80 : 60,
            child: InkWell(
              onTap: () async {
                await launchUrl('mailto:$email');
              },
              child: SizedBox(
                width: Get.width - 110,
                child: AutoSizeText(
                  '${"email".tr}: $email',
                  style: const TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              'assets/images/$party.png',
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
