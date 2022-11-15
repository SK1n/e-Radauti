import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:octo_image/octo_image.dart';

class AvatarImageWidget extends StatelessWidget {
  final String? link;
  const AvatarImageWidget({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OctoImage.fromSet(
        width: 100,
        height: 100,
        image: CachedNetworkImageProvider(
          link != null
              ? link!
              : 'https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png?hl=sv',
        ),
        octoSet: OctoSet.circleAvatar(
            backgroundColor: Colors.transparent,
            text: const BlurHash(hash: blurHash)),
        fit: BoxFit.cover,
      ),
    );
  }
}
