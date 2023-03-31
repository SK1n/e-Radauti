import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/settings/views/notification_settings.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/dark_mode_switch.dart';
import 'package:get/get.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      navBarMiddle: 'settings'.tr,
      navBarTrailing: const SizedBox(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              kDebugMode
                  ? ListTileSettings(
                      routeName: 'debug',
                      title: 'Debug',
                      leadingIcon: Icons.bug_report_outlined,
                      onTap: () {
                        Get.toNamed(Routes.debug);
                      })
                  : Container(),
              const NotificationSettings(),
              const DarkModeSwitch(),
            ],
          ),
        ),
      ],
    );
  }
}

class ListTileSettings extends StatelessWidget {
  final String title;
  final String routeName;
  final IconData? leadingIcon;
  final Function() onTap;
  const ListTileSettings({
    super.key,
    required this.title,
    this.leadingIcon,
    required this.routeName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading:
          leadingIcon != null ? Icon(leadingIcon) : const Icon(Icons.error),
      title: Text(title),
      trailing: Icon(
        Platform.isAndroid ? Icons.arrow_forward : Icons.arrow_forward_ios,
      ),
    );
  }
}
