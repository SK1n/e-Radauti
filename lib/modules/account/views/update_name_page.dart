import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/controllers/account_controller.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

class UpdateNamePage extends StatelessWidget {
  const UpdateNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.find();
    final GlobalKey<FormBuilderState> formKey = GlobalKey();
    return CustomPageScaffold(navBarMiddle: 'my-account'.tr, slivers: [
      SliverToBoxAdapter(
        child: FormBuilder(
          key: formKey,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
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
                          if (formKey.currentState!.fields['display_name']!
                              .validate()) {
                            await controller.updateDisplayName(formKey
                                .currentState!.fields['display_name']!.value);
                          }
                        },
                        child: Text('update-name'.tr)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
