import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/modules/account/controllers/sign_in_controller.dart';
import 'package:flutterapperadauti/modules/account/widgets/sign_up_text_widget.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController signInController = Get.find();
    final GlobalKey<FormBuilderState> formKey = GlobalKey();
    return CustomPageScaffold(
      navBarMiddle: 'log-in'.tr,
      navBarTrailing: InkWell(
        onTap: () => Get.toNamed(
          Routes.settings,
        ),
        child: const Icon(
          Icons.settings,
        ),
      ),
      slivers: [
        SliverToBoxAdapter(
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    name: 'email',
                    decoration: InputDecoration(hintText: 'email'.tr),
                    initialValue: '',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'required-field'.tr),
                      FormBuilderValidators.email(errorText: 'email-format'.tr),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    name: 'password',
                    decoration: InputDecoration(hintText: 'password'.tr),
                    initialValue: '',
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'required-field'.tr),
                    ]),
                  ),
                ),
                FilledButton.icon(
                  onPressed: () {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate()) {
                      signInController.signInEmail(
                        formKey.currentState!.fields['email']!.value,
                        formKey.currentState!.fields['password']!.value,
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                      minimumSize: Size(Get.width, 50),
                      backgroundColor: Colors.orange),
                  icon: const Icon(Icons.login),
                  label: Text('log-in'.tr),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.resetPassword);
                    },
                    child: Text(
                      'forgot-password'.tr,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                SignUpTextWidget(text: 'or-log-in-as'.tr.toUpperCase()),
                const SizedBox(
                  height: 10,
                ),
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
                  label: Text('guest'.tr),
                ),
                const SizedBox(
                  height: 10,
                ),
                SignUpTextWidget(text: 'create-new-account'.tr.toUpperCase()),
                const SizedBox(
                  height: 10,
                ),
                FilledButton.icon(
                  style: TextButton.styleFrom(
                    minimumSize: Size(Get.width, 50),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.signUp, parameters: {
                      "email": formKey.currentState!.fields['email']!.value
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: Text('create-new-account'.tr),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
