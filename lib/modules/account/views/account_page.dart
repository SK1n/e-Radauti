import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/account_controller.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.find();
    final GlobalKey<FormBuilderState> formKey = GlobalKey();
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'my-account'.tr,
            leading: Icons.person_4,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                FormBuilder(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${controller.getEmail()}",
                          style: Get.textTheme.headlineSmall,
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Obx(
                                  () => Text(
                                    controller.userData.value.name ?? "",
                                    style: Get.textTheme.headlineSmall,
                                  ),
                                ),
                              ),
                              const Divider(),
                              FormBuilderTextField(
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(FontAwesome.info),
                                    label: Text('display-name'.tr)),
                                name: 'display_name',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: FilledButton(
                                    style: TextButton.styleFrom(
                                        minimumSize: Size(Get.width, 40)),
                                    onPressed: () async {
                                      if (formKey
                                          .currentState!.fields['display_name']!
                                          .validate()) {
                                        await controller.updateDisplayName(
                                            formKey.currentState!
                                                .fields['display_name']!.value);
                                      }
                                    },
                                    child: Text('update-name'.tr)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Obx(
                                  () => Text(
                                    controller.userData.value.phoneNumber ?? "",
                                    style: Get.textTheme.headlineSmall,
                                  ),
                                ),
                              ),
                              const Divider(),
                              FormBuilderTextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(FontAwesome.info),
                                    label: Text('display-phone-number'.tr)),
                                name: 'display-phone-number',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.match(
                                      r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$',
                                      errorText: 'wrong-number-format'.tr),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: FilledButton(
                                    style: TextButton.styleFrom(
                                        minimumSize: Size(Get.width, 40)),
                                    onPressed: () async {
                                      if (formKey.currentState!
                                          .fields['display-phone-number']!
                                          .validate()) {
                                        await controller.updatePhoneNumber(
                                            formKey
                                                .currentState!
                                                .fields['display-phone-number']!
                                                .value);
                                      }
                                    },
                                    child: Text('update-phone-number'.tr)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton.icon(
                          style: TextButton.styleFrom(
                            minimumSize: Size(Get.width, 40),
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
                            minimumSize: Size(Get.width, 40),
                          ),
                          onPressed: () => Get.defaultDialog(
                            title: "Do you really want to sign out?",
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
      ),
    );
  }
}
