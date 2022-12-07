import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/account/controllers/get_account_details_controller.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GetAccountDetailsController controller =
        Get.put(GetAccountDetailsController());
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarUi(
            content: 'my-account'.tr,
            leading: Icons.person_4,
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Text("${"email".tr} : ${controller.getEmail()}"),
            ],
          ))
        ],
      ),
    );
  }
}
