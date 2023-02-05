import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';

class VolunteerWidget extends StatelessWidget with UrlLauncher {
  final String path;
  final String description;
  final String? phone;
  final String email;
  final String site;
  const VolunteerWidget({
    super.key,
    required this.path,
    required this.description,
    this.phone,
    required this.email,
    required this.site,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            ImageWidget.asset(
              link: path,
              height: 50,
              fit: BoxFit.scaleDown,
            ),
            SelectableAutoLinkText(
              description,
              textAlign: TextAlign.center,
              onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
              linkStyle: const TextStyle(color: Colors.pinkAccent),
              onTap: (link) async {
                await launchUrl(link);
              },
            ),
            phone != null
                ? SelectableAutoLinkText(
                    phone!,
                    textAlign: TextAlign.center,
                    onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
                    linkStyle: const TextStyle(color: Colors.pinkAccent),
                    onTap: (link) async {
                      await launchUrl('tel:$link');
                    },
                  )
                : Container(),
            SelectableAutoLinkText(
              email,
              textAlign: TextAlign.center,
              onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
              linkStyle: const TextStyle(color: Colors.pinkAccent),
              onTap: (link) async {
                await launchUrl('mailto:$link');
              },
            ),
            SelectableAutoLinkText(
              site,
              textAlign: TextAlign.center,
              onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
              linkStyle: const TextStyle(color: Colors.pinkAccent),
              onTap: (link) async {
                await launchUrl(link);
              },
            ),
          ],
        ),
      ),
    );
  }
}
