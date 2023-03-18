import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_cupertino_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/menu_list_tile.dart';
import 'package:get/get.dart';

class TownHallMain extends StatelessWidget {
  const TownHallMain({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomCupertinoPageScaffold(
      navBarMiddle: 'local-administration'.tr,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                  top: 10.0,
                ),
                width: MediaQuery.of(context).size.width - 30,
                child: Image.asset(
                  "assets/images/primaria.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              MenuListTile(
                title: 'lead'.tr,
                subtitle: 'lead-info'.tr,
                route: Routes.leaders,
              ),
              MenuListTile(
                title: 'local-council'.tr,
                subtitle: 'local-council-info'.tr,
                route: Routes.localCouncil,
              ),
              MenuListTile(
                title: 'local-council-meetings'.tr,
                subtitle: 'local-council-meetings-info'.tr,
                route: Routes.localMeetings,
              ),
              MenuListTile(
                title: 'local-council-decisions'.tr,
                subtitle: 'local-council-decisions-info'.tr,
                route: Routes.localLegislation,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
