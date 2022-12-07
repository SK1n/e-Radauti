// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/controllers/account_controller.dart';
import 'package:flutterapperadauti/modules/report_a_problem/controllers/form_controller.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/location_switch.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class ReportProblemForm extends StatelessWidget {
  const ReportProblemForm({super.key});
  @override
  Widget build(BuildContext context) {
    final NoticeProblemController controller =
        Get.put(NoticeProblemController());
    final AccountController accountController = Get.find();
    return FormBuilder(
      key: controller.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              decoration: InputDecoration(
                label: Text("${'name-surname'.tr} *"),
                floatingLabelAlignment: FloatingLabelAlignment.start,
              ),
              initialValue: '',
              name: 'name',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'required-field'.tr)
              ]),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormBuilderDropdown(
                  name: 'institution_email',
                  decoration:
                      InputDecoration(label: Text("${'institution'.tr} *")),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'required-field'.tr)
                  ]),
                  items: controller.dropdowns)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderDropdown(
              name: 'category',
              itemHeight: 80,
              decoration: InputDecoration(label: Text("${'category'.tr} *")),
              items: controller.category
                  .map((item) => DropdownMenuItem(
                        value: item.toString(),
                        child: Text(item),
                      ))
                  .toList(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'required-field'.tr)
              ]),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              decoration: InputDecoration(label: Text("${'subject'.tr} *")),
              name: 'subject',
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: 'required-field'.tr),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              initialValue: '',
              decoration: InputDecoration(
                label: Text("${'description'.tr} *"),
              ),
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              decoration:
                  InputDecoration(label: Text("${'phone-number'.tr} *")),
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              decoration: InputDecoration(label: Text("${'email'.tr} *")),
              name: 'email',
              initialValue: accountController.isSignedIn()
                  ? accountController.getEmail()
                  : '',
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: 'required-field'.tr),
                  FormBuilderValidators.email(errorText: 'email-format'.tr),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: LocationSwitch(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderImagePicker(
              decoration: InputDecoration(label: Text('images'.tr)),
              name: 'ImagePicker',
              initialValue: const [],
              maxImages: 3,
              previewMargin: const EdgeInsets.all(8),
              placeholderWidget: const Icon(
                Icons.add_a_photo,
                size: 40,
              ),
              //placeholderImage: AssetImage('assets/images/add-image.png'),
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                      errorText: 'required-field'.tr),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FilledButton(
                child: Text('send'.tr.toUpperCase()),
                onPressed: () {
                  {
                    controller.prepareDataAndUpload();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
