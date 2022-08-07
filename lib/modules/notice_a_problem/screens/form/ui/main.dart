// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/controllers/form_controller.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/ui/location_switch.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/ui/category_drop_down.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/ui/description_text_field.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/ui/email_text_field.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/ui/image_picker_field.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/ui/institution_drop_down.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/ui/name_text_field.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/ui/phone_number_text_field.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/ui/subject_text_field.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/upload_to_firebase.dart';
import 'package:get/get.dart';

class NoticeFormUi extends StatelessWidget {
  const NoticeFormUi({key});
  @override
  Widget build(BuildContext context) {
    final NoticeProblemController controller =
        Get.put(NoticeProblemController());
    return FormBuilder(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NameTextField(),
            InstitutionDropDown(),
            CategoryDropDown(),
            SubjectTextField(),
            DescriptionTextField(),
            PhoneNumberTextField(),
            EmailTextField(),
            LocationSwitch(),
            ImagePickerField(),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  primary: Colors.white,
                ),
                child: Text('Trimite'),
                onPressed: () {
                  {
                    UploadToFirebase().uploadToFirebase();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
