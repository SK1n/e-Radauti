import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:octo_image/octo_image.dart';

class AvatarImageWidget extends StatelessWidget {
  final ImageProvider<Object> image;
  AvatarImageWidget(
      {super.key, required link, this.width, this.height, required this.fit})
      : image = CachedNetworkImageProvider(
          link ??
              'https://firebasestorage.googleapis.com/v0/b/eradauti-nativ.appspot.com/o/5856.jpg?alt=media&token=934a054e-0902-4aa6-b7d0-59cf7ea7469c',
        );

  AvatarImageWidget.asset({
    super.key,
    required link,
    this.width = 100.0,
    this.height = 80.0,
    this.fit = BoxFit.fitWidth,
  }) : image = AssetImage(link!);

  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OctoImage.fromSet(
        width: width,
        height: height,
        image: image,
        octoSet: OctoSet.circleAvatar(
            backgroundColor: Colors.transparent,
            text: const BlurHash(hash: blurHash)),
        fit: BoxFit.cover,
      ),
    );
  }
}
