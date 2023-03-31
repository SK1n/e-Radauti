import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/menu_list_tile.dart';
import 'package:get/get.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      navBarMiddle: 'announces'.tr,
      slivers: [
        SliverList(
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
      ],
    );
  }
}
