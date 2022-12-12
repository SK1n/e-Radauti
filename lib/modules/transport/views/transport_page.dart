import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/menu_list_tile.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';

class TransportPage extends StatelessWidget {
  const TransportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'transport'.tr,
            leading: Icons.train,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  MenuListTile(
                    title: 'cabbies'.tr,
                    subtitle: 'cabbies-description'.tr,
                    route: Routes.taxi,
                  ),
                  MenuListTile(
                    title: 'trains'.tr,
                    subtitle: 'trains-description'.tr,
                    route: Routes.train,
                  ),
                  MenuListTile(
                    title: 'minibuses'.tr,
                    subtitle: 'minibuses-description'.tr,
                    route: Routes.bus,
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
