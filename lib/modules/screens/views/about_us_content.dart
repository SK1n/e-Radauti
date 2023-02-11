import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/linkable_text.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:get/get.dart';

class AboutUsContent extends StatelessWidget {
  const AboutUsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ImageWidget.asset(
                link: "assets/images/CoverAboutPage.png",
                height: 150,
              ),
              LinkableText.big("radautiul-civic-association".tr),
              LinkableText("about-us-content-description".tr),
            ],
          ),
        ),
      ],
    );
  }
}
