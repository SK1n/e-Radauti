import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/avatar_image_widget.dart';

class OnboardSlides extends StatelessWidget {
  final String? image;
  final String? title;
  final Widget? body;
  const OnboardSlides({super.key, this.image, this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarImageWidget.asset(
          link: image,
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            title!,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 12),
        body!,
      ],
    );
  }
}
