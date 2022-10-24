import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OldEventsCollapsedWidget extends StatelessWidget {
  final String? imageUrl;
  final String? headline;
  final String? timestamp;
  const OldEventsCollapsedWidget({
    super.key,
    this.imageUrl,
    this.headline,
    this.timestamp,
  });
  @override
  Widget build(BuildContext context) {
    return ExpandableButton(
      child: Card(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  width: Get.width,
                  child: Image.network(
                    imageUrl.toString(),
                    scale: 1.0,
                    fit: BoxFit.fitWidth,
                    height: 200,
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.9),
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text(
                      timestamp!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(
                '$headline',
                softWrap: true,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
