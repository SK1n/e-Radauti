import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/core/colors/c_colors.dart';
import 'package:flutterapperadauti/modules/reset_password/controllers/reset_password_controller.dart';
import 'package:flutterapperadauti/utils/extensions/outside_hint_text_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? email = Get.arguments as String?;
    return AppScaffold(
      appBarTitle: 'reset-password'.tr.toUpperCase(),
      body: SliverToBoxAdapter(
        child: FormBuilder(
          key: controller.formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'email',
                initialValue: email,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'required-field'.tr),
                    FormBuilderValidators.email(errorText: 'email-format'.tr),
                  ],
                ),
              ).outside('email-address'),
              GFButton(
                onPressed: () async {
                  await controller.sendEmailResetPassword();
                },
                text: "send-mail".tr,
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
    );
  }
}
