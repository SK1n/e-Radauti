import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/controllers/account_controller.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.find();
    final GlobalKey<FormBuilderState> formKey = GlobalKey();
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'my-account'.tr,
            leading: Icons.person_4,
          ),
          SliverFillRemaining(
            child: FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                      name: 'oldPassword',
                      initialValue: "",
                      decoration: InputDecoration(
                          label: Text("current-password".tr),
                          prefixIcon: const Icon(Icons.shield)),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(
                              errorText: 'required-field'.tr),
                          FormBuilderValidators.equal(controller.getPassword(),
                              errorText: "password-mismatch".tr),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                      name: 'newPassword',
                      initialValue: "",
                      onChanged: (value) {
                        controller.newPassword = value;
                      },
                      decoration: InputDecoration(
                          label: Text("new-password".tr),
                          prefixIcon: const Icon(Icons.key)),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(
                              errorText: 'required-field'.tr),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() => FormBuilderTextField(
                          name: 'reNewPassword',
                          decoration: InputDecoration(
                            label: Text("re-type-password".tr),
                            prefixIcon: const Icon(Icons.key),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                  errorText: 'required-field'.tr),
                              FormBuilderValidators.equal(
                                  controller.newPassword,
                                  errorText: "new-password-match".tr),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilledButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(Get.width, 40)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.updatePassword(
                            formKey.currentState!.fields["newPassword"]!.value,
                          );
                        }
                      },
                      child: Text('update-password'.tr),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
