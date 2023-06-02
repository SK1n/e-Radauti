import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/settings/views/notification_settings.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/dark_mode_switch.dart';
import 'package:get/get.dart';

class PermissionsPage extends StatelessWidget {
  const PermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      navBarMiddle: 'e-radauti'.tr,
      navBarTrailing: Container(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Text(
                'permissions-text'.tr,
                textAlign: TextAlign.center,
              ),
              const DarkModeSwitch(),
              const NotificationSettings(),
              FilledButton(
                onPressed: () => Get.offAllNamed(
                  Routes.logIn,
                ),
                child: Text(
                  'next'.tr,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
