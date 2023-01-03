import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/menu_list_tile.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';

class UsefullNumbersPage extends StatelessWidget {
  const UsefullNumbersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(slivers: [
        AppBarWidget(
          content: 'usefull-numbers'.tr,
          leading: Icons.perm_phone_msg,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: leftMargin,
            right: rightMargin,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                MenuListTile(
                  title: 'inconveniences'.tr,
                  subtitle: 'inconveniences-info'.tr,
                  route: Routes.localDisturbances,
                ),
                MenuListTile(
                  title: 'local-authorities'.tr,
                  subtitle: 'local-authorities-info'.tr,
                  route: Routes.localAuthorities,
                ),
                MenuListTile(
                  title: 'local-institutions'.tr,
                  subtitle: 'local-institutions-info'.tr,
                  route: Routes.publicInstitutions,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
