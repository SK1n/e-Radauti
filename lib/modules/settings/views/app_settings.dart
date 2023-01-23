import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/settings/views/notification_settings.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/dark_mode_switch.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:get/get.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  TextEditingController debugTextEditingController = TextEditingController();
  bool debugPasswordHasError = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          AppBarWidget(
            leading: Icons.settings,
            content: 'settings'.tr,
            trailing: Container(),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: leftMargin,
              right: rightMargin,
            ),
            sliver: SliverToBoxAdapter(
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
          ),
        ],
      ),
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
