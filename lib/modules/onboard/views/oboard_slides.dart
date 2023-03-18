import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/avatar_image_widget.dart';

class OnboardSlides extends StatelessWidget with UrlLauncher {
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
        AvatarImageWidget.asset(
          link: 'assets/images/radautiul_civic.jpg',
        ),
        SelectableText(
          'www.radautiulcivic.ro',
          onTap: () => launchUrlS('https://www.radautiulcivic.ro'),
        ),
      ],
    );
  }
}
