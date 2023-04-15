import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/core/colors/c_colors.dart';
import 'package:flutterapperadauti/modules/login/controller/login_controller.dart';
import 'package:flutterapperadauti/modules/account/widgets/sign_up_text_widget.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/assets.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/hint_text_field.dart';
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
      body: SliverToBoxAdapter(
        child: FormBuilder(
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
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Bine ai venit!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              HintTextField(
                name: 'email',
                hint: 'email-address',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                        errorText: 'required-field'.tr),
                    FormBuilderValidators.email(errorText: 'email-format'.tr),
                  ],
                ),
              ),
              HintTextField(
                hint: 'password',
                name: 'password',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: 'required-field'.tr,
                    ),
                  ],
                ),
              ),
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
                    )
                  ],
                ),
              ),
              GFButton(
                onPressed: () {},
                text: "Intră în cont",
                shape: GFButtonShape.pills,
                color: CColors.violet,
                size: GFSize.LARGE,
                blockButton: true,
                fullWidthButton: true,
              ),
              TextBetweenLines(text: 'sau'.tr.toUpperCase()),
              GFButton(
                onPressed: () {},
                text: 'Continuă ca vizitator',
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
                    text: 'Vrei să te înregistrezi în aplicație? ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Creează-ți cont',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // handle onTap event
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
