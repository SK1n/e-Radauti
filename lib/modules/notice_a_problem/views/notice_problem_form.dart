// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/controllers/form_controller.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/views/location_switch.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class NoticeProblemForm extends StatelessWidget {
  const NoticeProblemForm({super.key});
  @override
  Widget build(BuildContext context) {
    final NoticeProblemController controller =
        Get.put(NoticeProblemController());
    return FormBuilder(
      key: controller.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              decoration: const InputDecoration(
                label: Text('Nume și prenume'),
                floatingLabelAlignment: FloatingLabelAlignment.start,
              ),
              initialValue: '',
              name: 'name',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(errorText: errorRequired)]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderDropdown(
              name: 'institution_email',
              decoration: const InputDecoration(label: Text('Institutie')),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(errorText: errorRequired)]),
              items: controller.institutionDropDownList
                  .map((emailDestination) => DropdownMenuItem(
                        value: emailDestination,
                        child: Text('$emailDestination'),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderDropdown(
              name: 'category',
              itemHeight: 80,
              decoration: const InputDecoration(label: Text('Categorie')),
              items: controller.categoryDropDownList
                  .map((item) => DropdownMenuItem(
                        value: item[0],
                        child: Text('${item[0]}'),
                      ))
                  .toList(),
              validator: FormBuilderValidators.compose(
                  [FormBuilderValidators.required(errorText: errorRequired)]),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              decoration: const InputDecoration(label: Text('Subiect')),
              name: 'subject',
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(errorText: errorRequired),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              initialValue: '',
              decoration: const InputDecoration(
                label: Text('Descriere'),
              ),
              maxLines: 5,
              minLines: 1,
              name: 'description',

              //maxLines: null,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(errorText: errorRequired),
                  FormBuilderValidators.minLength(50,
                      errorText:
                          'Trebuie sa introduceti minimum 50 charactere'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              decoration:
                  const InputDecoration(label: Text('Număr de telefon')),
              name: 'phone',
              keyboardType: TextInputType.number,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(errorText: errorRequired),
                  FormBuilderValidators.numeric(
                      errorText: 'Acest camp trebuie sa contina numai numere!'),
                  FormBuilderValidators.match(
                      r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$',
                      errorText: errorPhonePattern),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              decoration: const InputDecoration(label: Text('Email')),
              name: 'email',
              initialValue: '',
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(errorText: errorRequired),
                  FormBuilderValidators.email(errorText: errorEmail),
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
              decoration: const InputDecoration(label: Text('Imagini')),
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
                  FormBuilderValidators.required(errorText: errorRequired),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FilledButton(
                child: const Text('Trimite'),
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
