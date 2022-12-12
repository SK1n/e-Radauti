import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/menu_list_tile.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'announces'.tr,
            leading: Icons.announcement,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  MenuListTile(
                    title: 'local-announces'.tr,
                    subtitle: 'local-announces-info'.tr,
                    route: Routes.localAnnouncements,
                  ),
                  MenuListTile(
                    title: 'jobs'.tr,
                    subtitle: 'jobs-info'.tr,
                    route: Routes.jobs,
                  ),
                  MenuListTile(
                    title: 'real-estate'.tr,
                    subtitle: 'real-estate-info'.tr,
                    route: Routes.furniture,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
