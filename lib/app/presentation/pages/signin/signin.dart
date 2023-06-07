import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/app/application/signin/sign_in_form_bloc.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:flutterapperadauti/app/infrastructure/auth/auth_failure_or_success.dart';
import 'package:flutterapperadauti/app/injection.dart';
import 'package:flutterapperadauti/core/colors/c_colors.dart';
import 'package:flutterapperadauti/modules/account/widgets/sign_up_text_widget.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/assets.dart';
import 'package:flutterapperadauti/utils/extensions/outside_hint_text_field.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final GlobalKey<FormBuilderState> formKey = GlobalKey();
    return AppScaffold(
      slivers: [
        BlocProvider(
          create: (_) => getIt<SignInFormBloc>(),
          child: BlocConsumer<SignInFormBloc, SignInFormState>(
            listener: (context, state) {
              if (state.authFailureOrSuccess ==
                  const AuthFailureOrSuccess.success()) {
                // TODO: push main
              } else if (state.authFailureOrSuccess ==
                  const AuthFailureOrSuccess.invalidEmailAndPassword()) {
                showSnackbar(context, t.singInScreen.wrongEmailPassword);
              } else {
                showSnackbar(context, t.singInScreen.serverError);
              }
            },
            builder: (context, state) => FormBuilder(
              key: formKey,
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
                      t.singInScreen.welcome,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'email',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: t.formats.requiredField),
                        FormBuilderValidators.email(
                            errorText: t.formats.emailFormat),
                      ],
                    ),
                    onChanged: (value) {
                      context.read<SignInFormBloc>().add(
                            SignInFormEvent.emailChange(
                              value ?? '',
                            ),
                          );
                    },
                  ).outside(t.singInScreen.emailTextField),
                  FormBuilderTextField(
                    name: 'password',
                    obscureText: true,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                          errorText: t.formats.requiredField,
                        ),
                      ],
                    ),
                    onChanged: (value) {
                      context.read<SignInFormBloc>().add(
                            SignInFormEvent.passwordChange(value ?? ""),
                          );
                    },
                  ).outside(t.singInScreen.passwordTextField),
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
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  state.isSubmitting
                      ? const LoadingWidget()
                      : GFButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              context.read<SignInFormBloc>().add(
                                    const SignInFormEvent
                                        .signInWithEmailAndPassword(),
                                  );
                            }
                          },
                          text: t.singInScreen.logInButton,
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
          ),
        )
      ],
      appBarTitle: t.singInScreen.title,
    );
  }

  void showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
