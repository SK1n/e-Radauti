import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/modules/account/controllers/sign_up_controller.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey();
    final SignUpController signUpController = Get.find();
    final String email = Get.parameters['email'].toString();
    return Scaffold(
      body: CustomScrollView(
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
                          'create-new-account'.tr.toUpperCase(),
                          style: Get.textTheme.headlineLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormBuilderTextField(
                            name: 'email',
                            decoration: InputDecoration(
                                hintText: "${'email'.tr} *",
                                prefixIcon: const Icon(Icons.email)),
                            initialValue: email,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'required-field'.tr),
                              FormBuilderValidators.email(
                                  errorText: 'email-format'.tr),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormBuilderTextField(
                            name: 'phone_number',
                            decoration: InputDecoration(
                                hintText: "${'phone-number'.tr} *",
                                prefixIcon: const Icon(Icons.phone)),
                            keyboardType: TextInputType.number,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.match(
                                  r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$',
                                  errorText: 'wrong-number-format'.tr),
                              FormBuilderValidators.required(
                                  errorText: 'required-field'.tr),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormBuilderTextField(
                            name: 'name',
                            decoration: InputDecoration(
                                hintText: "${'name-surname'.tr} *",
                                prefixIcon: const Icon(Icons.person_4)),
                            initialValue: '',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'required-field'.tr),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormBuilderTextField(
                            name: 'password',
                            decoration: InputDecoration(
                                hintText: "${'password'.tr} *",
                                prefixIcon: const Icon(Icons.password)),
                            initialValue: '',
                            obscureText: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'required-field'.tr),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilledButton.icon(
                            style: TextButton.styleFrom(
                              minimumSize: Size(Get.width, 50),
                            ),
                            onPressed: () {
                              var form = formKey.currentState!;
                              if (formKey.currentState!.validate()) {
                                signUpController.createAccount(
                                    form.fields['email']!.value,
                                    form.fields['password']!.value,
                                    form.fields['phone_number']?.value ?? "",
                                    form.fields['name']?.value ?? "");
                              }
                            },
                            icon: const Icon(Icons.add),
                            label: Text('create-new-account'.tr.toUpperCase()),
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
