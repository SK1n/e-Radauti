import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class ImageWidget extends StatelessWidget {
  final String? link;
  final double? height;
  final double? width;
  const ImageWidget(
      {super.key, required this.link, this.width, this.height = 200});

  @override
  Widget build(BuildContext context) {
    return OctoImage(
      image: CachedNetworkImageProvider(
        link != null
            ? link!
            : 'https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png?hl=sv',
      ),
      placeholderBuilder: OctoPlaceholder.blurHash(
        blurHash,
      ),
      height: height,
      width: width ?? Get.width,
      errorBuilder: OctoError.icon(color: Colors.red),
      fit: BoxFit.cover,
    );
  }
}
