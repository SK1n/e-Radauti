import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/controllers/account_controller.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_cupertino_page_scaffold.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.find();
    final GlobalKey<FormBuilderState> formKey = GlobalKey();
    return CustomCupertinoPageScaffold(
      navBarMiddle: 'my-account'.tr,
      navBarTrailing: InkWell(
        onTap: () => Get.toNamed(Routes.settings),
        child: const Icon(
          Icons.settings,
        ),
      ),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              FormBuilder(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "email-value".trParams(
                          {
                            "email": controller.getEmail(),
                          },
                        ),
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    Obx(
                      () => Text(
                        "username".trParams(
                          {
                            "name": controller.username,
                          },
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton.icon(
                        style: TextButton.styleFrom(
                          minimumSize: Size(Get.width, 40),
                        ),
                        onPressed: () => Get.toNamed(Routes.updateName),
                        icon: const Icon(Icons.person),
                        label: Text('update-name'.tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton.icon(
                        style: TextButton.styleFrom(
                          minimumSize: Size(Get.width, 40),
                        ),
                        onPressed: () => Get.toNamed(Routes.updatePassword),
                        icon: const Icon(Icons.key),
                        label: Text('update-password'.tr),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton.icon(
                        style: TextButton.styleFrom(
                          minimumSize: Size(Get.width, 40),
                        ),
                        onPressed: () => Get.defaultDialog(
                          title: "sign-out-text".tr,
                          middleText: '',
                          onConfirm: () => controller.signOut(),
                          textConfirm: 'yes'.tr,
                          textCancel: 'no'.tr,
                        ),
                        icon: const Icon(Icons.logout),
                        label: Text('sign-out'.tr),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
