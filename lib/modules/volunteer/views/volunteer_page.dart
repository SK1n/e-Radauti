import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/volunteer/views/volunteer_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:get/get.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      navBarMiddle: 'volunteering'.tr,
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          delegate: SliverChildListDelegate(
            [
              VolunteerWidget(
                path: "assets/images/volunteer/rc_logo_web.png",
                description: "radautiul-civic".tr,
                phone: 'radautiul-civic-phone'.tr,
                email: 'radautiul-civic-email'.tr,
                site: 'radautiul-civic-site'.tr,
              ),
              VolunteerWidget(
                path: "assets/images/volunteer/toastmasters.jpg",
                description: "toast-master".tr,
                phone: 'toast-master-phone'.tr,
                email: 'toast-master-email'.tr,
                site: 'toast-master-site'.tr,
              ),
              VolunteerWidget(
                path: "assets/images/volunteer/eco_montan.jpg",
                description: "club-eco".tr,
                phone: 'club-eco-phone'.tr,
                email: 'club-eco-email'.tr,
                site: 'club-eco-site'.tr,
              ),
              VolunteerWidget(
                path: "assets/images/volunteer/asociatia_bafi.png",
                description: "bafi".tr,
                phone: 'bafi-phone'.tr,
                email: 'bafi-email'.tr,
                site: 'bafi-site'.tr,
              ),
              VolunteerWidget(
                path: "assets/images/volunteer/door_to_home.png",
                description: "door-to-home".tr,
                phone: 'door-to-home-phone'.tr,
                email: 'door-to-home-email'.tr,
                site: 'door-to-home-site'.tr,
              ),
              VolunteerWidget(
                path: "assets/images/volunteer/maria_ward.png",
                description: "maria-ward".tr,
                phone: 'maria-ward-phone'.tr,
                email: 'maria-ward-email'.tr,
                site: 'maria-ward-site'.tr,
              ),
              VolunteerWidget(
                path: "assets/images/volunteer/umania.png",
                description: "umania".tr,
                email: 'umania-email'.tr,
                site: 'umania-site'.tr,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
