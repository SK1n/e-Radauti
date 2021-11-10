import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/notice_a_problem/location_switch.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/description_text_field.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/email_text_field.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/image_picker_field.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/institution_drop_down.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/name_text_field.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/phone_number_text_field.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/send_button.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/subject_text_field.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/type_drop_down.dart';
import 'package:flutterapperadauti/state/loading_state.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:provider/provider.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';

class NoticeFormUi extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldState;
  const NoticeFormUi({key, this.scaffoldState});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    IsLoading isLoading = Provider.of<IsLoading>(context);
    return FormBuilder(
      key: _formKey,
      child: isLoading.loading
          ? LoadingScreen()
          : ListView(
              padding: const EdgeInsets.all(10.0),
              children: [
                NameTextField(),
                InstitutionDropDown(),
                Padding(
                  child: Text('Alegeti o categorie de sesizare'),
                  padding: EdgeInsets.only(top: 20),
                ),
                TypeDropDown(),
                SubjectTextField(),
                DescriptionTextField(),
                PhoneNumberTextField(),
                EmailTextField(),
                LocationSwitch(),
                ImagePickerField(),
                SendButton(
                  formKey: _formKey,
                  scaffoldState: scaffoldState,
                )
              ],
            ),
    );
  }
}
