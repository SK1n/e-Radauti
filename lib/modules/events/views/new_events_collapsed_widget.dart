import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:get/get.dart';

class NewEventsCollapsedWidget extends StatelessWidget {
  final String? imageUrl;
  final String? headline;
  final String? timestamp;
  const NewEventsCollapsedWidget(
      {super.key, this.imageUrl, this.headline, this.timestamp});

  @override
  Widget build(BuildContext context) {
    return ExpandableButton(
      child: Card(
        elevation: 5,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ImageWidget(
              link: imageUrl,
              fit: BoxFit.fitWidth,
              width: Get.width,
              height: 300,
            ),
            Container(
              color: Get.theme.primaryColor.withOpacity(0.9),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      headline!,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      timestamp!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
