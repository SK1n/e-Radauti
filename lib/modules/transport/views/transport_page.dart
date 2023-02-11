import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_cupertino_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/menu_list_tile.dart';
import 'package:get/get.dart';

class TransportPage extends StatelessWidget {
  const TransportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoPageScaffold(
      navBarMiddle: 'transport'.tr,
      slivers: [
        SliverList(
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
            ],
          ),
        ),
      ],
    );
  }
}
