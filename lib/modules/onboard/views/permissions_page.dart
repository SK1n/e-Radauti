import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapperadauti/modules/settings/views/notification_settings.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/dark_mode_switch.dart';
import 'package:get/get.dart';

class PermissionsPage extends StatelessWidget {
  const PermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'e-radauti'.tr,
            trailing: Container(),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 10,
              left: leftMargin,
              right: rightMargin,
            ),
            sliver: SliverList(
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
                      Routes.signIn,
                    ),
                    child: Text(
                      'next'.tr,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
