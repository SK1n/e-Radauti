import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/modules/account/controllers/sign_in_controller.dart';
import 'package:flutterapperadauti/modules/account/widgets/sign_up_text_widget.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController signInController = Get.find();
    final GlobalKey<FormBuilderState> formKey = GlobalKey();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Navigator.canPop(context)
                      ? Padding(
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
                        )
                      : Container(),
                  FormBuilder(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height / 15,
                        ),
                        Text(
                          'AUTENTIFICARE',
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
                        FilledButton.icon(
                            onPressed: () {
                              formKey.currentState!.save();
                              if (formKey.currentState!.validate()) {
                                signInController.signInEmail(
                                  formKey.currentState!.fields['email']!.value,
                                  formKey
                                      .currentState!.fields['password']!.value,
                                );
                              }
                            },
                            style: TextButton.styleFrom(
                                minimumSize: Size(Get.width, 50),
                                backgroundColor: Colors.orange),
                            icon: const Icon(Icons.login),
                            label: const Text('Autentificare')),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.resetPassword);
                            },
                            child: const Text(
                              'Am uitat parola',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        const SignUpTextWidget(text: 'SAU AUTENTIFICARE PRIN'),
                        const SizedBox(
                          height: 10,
                        ),
                        // FilledButton.icon(
                        //   style: TextButton.styleFrom(
                        //     minimumSize: Size(Get.width, 50),
                        //   ),
                        //   onPressed: () async {
                        //     await signInController.signInWithGoogle();
                        //   },
                        //   icon: const Icon(FontAwesome.google),
                        //   label: const Text('Google'),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        FilledButton.icon(
                          style: TextButton.styleFrom(
                            minimumSize: Size(Get.width, 50),
                          ),
                          onPressed: () async {
                            await signInController.signInAsGuest();
                          },
                          icon: const Icon(Icons.person),
                          label: const Text('Oaspete'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SignUpTextWidget(text: 'CREAZA UN CONT'),
                        const SizedBox(
                          height: 10,
                        ),
                        FilledButton.icon(
                          style: TextButton.styleFrom(
                            minimumSize: Size(Get.width, 50),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.signUp, parameters: {
                              "email":
                                  formKey.currentState!.fields['email']!.value
                            });
                          },
                          icon: const Icon(Icons.add),
                          label: const Text('Creaza un cont nou'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}