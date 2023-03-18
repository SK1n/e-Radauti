import 'package:flutter/material.dart';

import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';

class LinkableText extends StatelessWidget with UrlLauncher {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  const LinkableText(this.text, {super.key, this.textStyle, this.textAlign});
  LinkableText.big(
    this.text, {
    super.key,
  })  : textStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        textAlign = TextAlign.center;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectableAutoLinkText(
        text,
        textAlign: textAlign,
        onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
        linkStyle: const TextStyle(color: Colors.pinkAccent),
        style: textStyle,
        onTap: (link) async {
          await launchUrlS(link);
        },
      ),
    );
  }
}
