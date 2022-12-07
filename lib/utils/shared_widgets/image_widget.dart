import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({
    super.key,
    required link,
    this.width,
    this.height = 200,
    this.fit = BoxFit.cover,
  }) : image = CachedNetworkImageProvider(
          link != null
              ? link!
              : 'https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png?hl=sv',
        );

  ImageWidget.asset({
    super.key,
    required link,
    this.width,
    this.height = 80.0,
    this.fit = BoxFit.fitWidth,
  }) : image = AssetImage(link!);

  final double? height;
  final double? width;
  final ImageProvider<Object> image;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return OctoImage(
      image: image,
      placeholderBuilder: OctoPlaceholder.blurHash(
        blurHash,
      ),
      height: height,
      width: width ?? Get.width,
      errorBuilder: OctoError.icon(color: Colors.red),
      fit: fit,
    );
  }
}
