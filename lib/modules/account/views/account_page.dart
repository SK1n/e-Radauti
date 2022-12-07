import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/controllers/account_controller.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.find();
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarUi(
            content: 'my-account'.tr,
            leading: Icons.person_4,
          ),
          SliverFillRemaining(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${controller.getEmail()}",
                  style: Get.textTheme.headlineSmall,
                ),
              ),
              Expanded(child: Column()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: Size(Get.width - 40, 40),
                  ),
                  onPressed: () => Get.toNamed(Routes.updatePassword),
                  icon: const Icon(Icons.logout),
                  label: Text('update-password'.tr),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: Size(Get.width - 40, 40),
                  ),
                  onPressed: () => controller.signOut(),
                  icon: const Icon(Icons.logout),
                  label: Text('sign-out'.tr),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
