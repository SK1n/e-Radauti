import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/linkable_text.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:get/get.dart';

class AboutUsApp extends StatelessWidget {
  const AboutUsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                ImageWidget.asset(
                  link: "assets/images/coperta_hai_sa_digitalizam.png",
                  height: 150,
                ),
                LinkableText.big("app-radauti".tr),
                LinkableText("about-us-app-description".tr),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
