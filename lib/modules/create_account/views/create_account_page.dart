import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/core/colors/c_colors.dart';
import 'package:flutterapperadauti/modules/create_account/controllers/sign_up_controller.dart';
import 'package:flutterapperadauti/utils/extensions/outside_hint_text_field.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

class CreateAccountPage extends GetView<SignUpController> {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "create-new-account".tr.toUpperCase(),
      slivers: [
        SliverToBoxAdapter(
          child: FormBuilder(
            key: controller.formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'email',
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                          errorText: 'required-field'.tr),
                      FormBuilderValidators.email(errorText: 'email-format'.tr),
                    ],
                  ),
                ).outside('email'),
                FormBuilderTextField(
                  name: 'phone_number',
                  keyboardType: TextInputType.phone,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.match(
                          r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$',
                          errorText: 'wrong-number-format'.tr),
                      FormBuilderValidators.required(
                          errorText: 'required-field'.tr),
                    ],
                  ),
                ).outside('phone-number'),
                FormBuilderTextField(
                  name: 'name',
                  keyboardType: TextInputType.name,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                          errorText: 'required-field'.tr),
                    ],
                  ),
                ).outside('name-surname'),
                Obx(
                  () => FormBuilderTextField(
                    name: 'password',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: 'required-field'.tr),
                      ],
                    ),
                    obscureText: controller.obscurePassword,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              controller.obscurePassword =
                                  !controller.obscurePassword;
                            },
                            child: Visibility(
                              replacement: const Icon(
                                FontAwesome5.eye_slash,
                                color: Colors.black,
                              ),
                              visible: !controller.obscurePassword,
                              child: const Icon(
                                FontAwesome5.eye,
                                color: Colors.black,
                              ),
                            ))),
                  ).outside('password'),
                ),
                const SizedBox(
                  height: 30,
                ),
                GFButton(
                  onPressed: () async {
                    await controller.createAcc();
                  },
                  text: "create-new-account".tr,
                  shape: GFButtonShape.pills,
                  color: CColors.violet,
                  size: GFSize.LARGE,
                  blockButton: true,
                  fullWidthButton: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
