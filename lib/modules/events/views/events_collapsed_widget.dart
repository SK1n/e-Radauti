import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:get/get.dart';

class EventsCollapsedWidget extends StatelessWidget {
  final String? imageUrl;
  final String? headline;
  final String? timestamp;
  final bool isActive;
  const EventsCollapsedWidget(
      {super.key, this.imageUrl, this.headline, this.timestamp,this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return ExpandableButton(
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            IntrinsicWidth(
              stepWidth: 20,
              child: Container(color: Colors.green,width: isActive ? 10 : 0,height: 300,
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ImageWidget(
                    link: imageUrl,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 300,
                  ),
                  Container(
                    color: Get.theme.primaryColor.withOpacity(0.9),
                    width: double.infinity,
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
          ],
        ),
      ),
    );
  }
}
