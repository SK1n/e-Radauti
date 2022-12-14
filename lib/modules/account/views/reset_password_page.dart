import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/modules/account/controllers/reset_password_controller.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey();
    final ResetPasswordController resetPasswordController = Get.find();
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FormBuilder(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height / 10,
                        ),
                        Text(
                          'reset-password'.tr,
                          style: Get.textTheme.headlineLarge,
                        ),
                        FormBuilderTextField(
                          name: 'email',
                          initialValue: '',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(hintText: 'email'.tr),
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                  errorText: 'required-field'.tr),
                              FormBuilderValidators.email(
                                  errorText: 'email-format'.tr),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: FilledButton.icon(
                            onPressed: () async {
                              formKey.currentState!.save();
                              if (formKey.currentState!.validate()) {
                                await resetPasswordController.forgotPassword(
                                    formKey
                                        .currentState!.fields['email']!.value);
                              }
                            },
                            icon: const Icon(Icons.send),
                            style: TextButton.styleFrom(
                                minimumSize: Size(Get.width, 50),
                                backgroundColor: Colors.orange),
                            label: Text(
                              'send-mail'.tr.toUpperCase(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
