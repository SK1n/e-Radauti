import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/core/colors/c_colors.dart';
import 'package:flutterapperadauti/modules/login/controller/login_controller.dart';
import 'package:flutterapperadauti/modules/account/widgets/sign_up_text_widget.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/assets.dart';
import 'package:flutterapperadauti/utils/extensions/outside_hint_text_field.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        FormBuilder(
          key: controller.formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  Assets.logoImagesRc,
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'welcome'.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              FormBuilderTextField(
                name: 'email',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'required-field'.tr),
                    FormBuilderValidators.email(errorText: 'email-format'.tr),
                  ],
                ),
              ).outside('email-address'),
              FormBuilderTextField(
                name: 'password',
                obscureText: true,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: 'required-field'.tr,
                    ),
                  ],
                ),
              ).outside('password'),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: FormBuilderCheckbox(
                        name: "rememberme",
                        title: Text(
                          'remember-me'.tr,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'forgot-password'.tr,
                        style: const TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Get.toNamed(
                          Routes.resetPassword,
                          arguments: controller
                              .formKey.currentState!.fields['email']!.value,
                        );
                      },
                    ),
                  ],
                ),
              ),
              GFButton(
                onPressed: () async {
                  await controller.login();
                },
                text: "log-in".tr,
                shape: GFButtonShape.pills,
                color: CColors.violet,
                size: GFSize.LARGE,
                blockButton: true,
                fullWidthButton: true,
              ),
              TextBetweenLines(text: 'or'.tr.toUpperCase()),
              GFButton(
                onPressed: () {},
                text: 'guest'.tr,
                shape: GFButtonShape.pills,
                color: CColors.lightBlue,
                size: GFSize.LARGE,
                blockButton: true,
                textColor: Colors.blue,
                fullWidthButton: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RichText(
                  text: TextSpan(
                    text: 'register-account'.tr,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'create-new-account'.tr,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.createAccount);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      appBarTitle: 'log-in'.tr,
    );
  }
}
