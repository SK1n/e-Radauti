import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/linkable_text.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';

class Confidential extends StatelessWidget {
  const Confidential({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'privacy'.tr,
            leading: Icons.add_box_outlined,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  LinkableText.big('privacy-terms'.tr),
                  LinkableText('privacy-terms-description'.tr),
                  LinkableText.big('collection-use'.tr),
                  LinkableText('collection-use-description'.tr),
                  LinkableText.big('google-play-services'.tr),
                  LinkableText('google-play-services-description'.tr),
                  LinkableText.big('cookies'.tr),
                  LinkableText('cookies-description'.tr),
                  LinkableText.big('service-providers'.tr),
                  LinkableText('service-providers-description'.tr),
                  LinkableText.big('third-party-services'.tr),
                  LinkableText('third-party-services-description'.tr),
                  LinkableText.big('security'.tr),
                  LinkableText('security-description'.tr),
                  LinkableText.big('child-privacy'.tr),
                  LinkableText('child-privacy-description'.tr),
                  LinkableText.big('chnages-privacy'.tr),
                  LinkableText('changes-privacy-description'.tr),
                  LinkableText.big('contact-us'.tr),
                  LinkableText('contact-us-description'.tr),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
