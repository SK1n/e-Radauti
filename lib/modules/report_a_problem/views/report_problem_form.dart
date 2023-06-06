// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/controllers/account_controller.dart';
import 'package:flutterapperadauti/modules/report_a_problem/controllers/report_problem_controller.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/location_switch.dart';
import 'package:flutterapperadauti/utils/extensions/outside_hint_dropdown.dart';
import 'package:flutterapperadauti/utils/extensions/outside_hint_image_picker.dart';
import 'package:flutterapperadauti/utils/extensions/outside_hint_switch.dart';
import 'package:flutterapperadauti/utils/extensions/outside_hint_text_field.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class ReportProblemForm extends GetView<ReportProblemController> {
  const ReportProblemForm({super.key});
  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          FormBuilder(
            key: controller.formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  initialValue: accountController.username,
                  name: 'name',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'required-field'.tr)
                  ]),
                ).outside('name-surname'.tr),
                FormBuilderDropdown(
                        name: 'institution_email',
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(
                                errorText: 'required-field'.tr),
                          ],
                        ),
                        items: controller.dropDown.entries.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e.value),
                          );
                        }).toList())
                    .outside('institution'.tr),
                FormBuilderDropdown(
                  name: 'category',
                  itemHeight: 80,
                  items: controller.category
                      .map((item) => DropdownMenuItem(
                            value: item.toString(),
                            child: Text(item),
                          ))
                      .toList(),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'required-field'.tr)
                  ]),
                ).outside('category'.tr),
                FormBuilderTextField(
                  name: 'subject',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                          errorText: 'required-field'.tr),
                    ],
                  ),
                ).outside('subject'.tr),
                FormBuilderTextField(
                  initialValue: '',
                  maxLines: 5,
                  minLines: 1,
                  name: 'description',
                  //maxLines: null,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                          errorText: 'required-field'.tr),
                      FormBuilderValidators.minLength(50,
                          errorText: 'minimum-50'.tr),
                    ],
                  ),
                ).outside('description'.tr),
                FormBuilderTextField(
                  name: 'phone',
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                          errorText: 'required-field'.tr),
                      FormBuilderValidators.numeric(
                          errorText: 'only-numbers-field'.tr),
                      FormBuilderValidators.match(
                          r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$',
                          errorText: 'wrong-number-format'.tr),
                    ],
                  ),
                ).outside('phone-number'.tr),
                FormBuilderTextField(
                  name: 'email',
                  initialValue: accountController.getEmail(),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                          errorText: 'required-field'.tr),
                      FormBuilderValidators.email(errorText: 'email-format'.tr),
                    ],
                  ),
                ).outside('email'),
                FormBuilderSwitch(
                  name: 'use-location',
                  title: Text(
                    'add-location'.tr,
                  ),
                ).outside(''),
                FormBuilderImagePicker(
                  name: 'ImagePicker',
                  initialValue: const [],
                  maxImages: 3,
                  previewMargin: const EdgeInsets.all(8),
                  placeholderWidget: const Icon(
                    Icons.add_a_photo,
                    size: 40,
                  ),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                          errorText: 'required-field'.tr),
                    ],
                  ),
                ).outside('images'.tr),
              ],
            ),
          ),
          Obx(
            () => controller.isLoading
                ? const LoadingWidget()
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FilledButton(
                      child: Text('send'.tr.toUpperCase()),
                      onPressed: () async {
                        {
                          await controller.prepareDataAndUpload();
                        }
                      },
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
