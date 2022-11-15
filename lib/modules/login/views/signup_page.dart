import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/modules/login/controllers/sign_up_controller.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey();
    final SignUpController signUpController = Get.find();
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
                          'CREAZA UN CONT',
                          style: Get.textTheme.headlineLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormBuilderTextField(
                            name: 'email',
                            decoration:
                                const InputDecoration(hintText: 'Email'),
                            initialValue: '',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: errorRequired),
                              FormBuilderValidators.email(
                                  errorText: errorEmail),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormBuilderTextField(
                            name: 'password',
                            decoration:
                                const InputDecoration(hintText: 'Parola'),
                            initialValue: '',
                            obscureText: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: errorRequired),
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
                                    form.fields['password']!.value);
                              }
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('Creaza un cont nou'),
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
