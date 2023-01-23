import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewEventsCollapsedWidget extends StatelessWidget {
  final String? imageUrl;
  final String? headline;
  final String? timestamp;
  const NewEventsCollapsedWidget(
      {super.key, this.imageUrl, this.headline, this.timestamp});

  getImageSize() {}

  @override
  Widget build(BuildContext context) {
    Image image = Image.network(
      imageUrl.toString(),
    );
    Size size = const Size(0, 0);
    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((image, synchronousCall) {
      var img = image.image;
      size = Size(img.width.toDouble(), img.height.toDouble());
    }));
    return ExpandableButton(
      child: Card(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  width: size.width > Get.width ? Get.width : size.width,
                  child: Image.network(
                    imageUrl.toString(),
                    scale: 1.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  color: Get.theme.cardColor,
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
