// ignore_for_file: missing_return

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
import 'package:flutterapperadauti/state/geolocator_state.dart';
import 'package:flutterapperadauti/state/loading_state.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:provider/provider.dart';

class NoticeFormUi extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldState;
  const NoticeFormUi({key, this.scaffoldState});

  @override
  State<NoticeFormUi> createState() => _NoticeFormUiState();
}

class _NoticeFormUiState extends State<NoticeFormUi> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    IsLoading isLoading = Provider.of<IsLoading>(context);
    DownloadableList downloadableList =
        Provider.of<DownloadableList>(context, listen: false);
    GeolocatorState locationSwitchState =
        Provider.of<GeolocatorState>(context, listen: false);
    NoticeFormState noticeFormState =
        Provider.of<NoticeFormState>(context, listen: false);
    SendButtonLoadingState sendButtonLoadingState =
        Provider.of<SendButtonLoadingState>(context, listen: false);

    Future<void> uploadImageToFirebase(dynamic file) async {
      FirebaseStorage storage = FirebaseStorage.instance;

      Reference ref = storage.ref().child(
          'Notice_A_Problem/${DateTime.now().millisecondsSinceEpoch.toString() + Random().nextInt(3000).toString()}');
      UploadTask uploadTask;

      File newFile = File(file.path);

      try {
        uploadTask = ref.putFile(newFile);
        await downloadableList
            .addLink(await (await uploadTask).ref.getDownloadURL());
      } catch (e) {
        debugPrint('upload:$e');
      }
    }

    void resetData() {
      noticeFormState.upIndex(0);
      noticeFormState.upDescription('');
      noticeFormState.upPhoneNumber('');
      noticeFormState.upEmail('');
      noticeFormState.upTypeName('Altele');
      noticeFormState.upName('');
      noticeFormState.getPosition(null);
      noticeFormState.upInstitutionEmail('radautiulcivic@gmail.com');
      noticeFormState.upSubject('');
      noticeFormState.upInstitution('Asociația Rădăuțiul Civic');
    }

    sendData() async {
      final firestoreInstance = FirebaseFirestore.instance;
      isLoading.changeLoadingState();
      try {
        await Future.forEach(_formKey.currentState.fields['image'].value,
            (element) async => uploadImageToFirebase(element));

        var data = [
          {
            "category": noticeFormState.category,
            "description": noticeFormState.description,
            "index": noticeFormState.index,
            "institution": noticeFormState.institution,
            "institution_email": noticeFormState.institutionEmail,
            "lat": locationSwitchState.valueSwitch
                ? noticeFormState.position.latitude
                : null,
            "long": locationSwitchState.valueSwitch
                ? noticeFormState.position.longitude
                : null,
            "status": "În lucru",
            "subject": noticeFormState.subject,
            "email": noticeFormState.email,
            "name": noticeFormState.name,
            "url": downloadableList.list,
            "phone": noticeFormState.phoneNumber,
          }
        ];
        CollectionReference collectionReference =
            firestoreInstance.collection('collection');
        DocumentReference documentReference =
            collectionReference.doc('Markers');
        CollectionReference collectionReferenceNotifications =
            firestoreInstance.collection('notifications');
        DocumentReference documentReferenceNotifications =
            collectionReferenceNotifications.doc('Sesizari');
        await documentReferenceNotifications
            .update({"sesizari": FieldValue.arrayUnion(data)});
        await documentReference
            .update({"markers": FieldValue.arrayUnion(data)}).then((value) {
          resetData();
          locationSwitchState.changeValueSwitch(false);
          downloadableList.deleteList();
          isLoading.changeLoadingState();
          ScaffoldMessenger.of(widget.scaffoldState.currentState.context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text('Reusit. Veti primi un email in cateva minute'),
              backgroundColor: Colors.greenAccent,
            ));
        });
      } on Exception catch (e) {
        isLoading.changeLoadingState();
        downloadableList.deleteList();
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text('Esuat. Va rugam sa incercati din nou.'),
            backgroundColor: Colors.redAccent,
          ));
      }
    }

    showConfirmDialog(var formKey) async {
      Platform.isIOS
          ? CupertinoAlertDialog(
              title: Text('Vreti sa trimiteti formularul?'),
              content: Text(
                  'Verificati ca toate datele sa fie corecte!\nDaca sunt corecte apasati pe Trimite\nDaca vreti sa faceti modificari apasati pe nu si reveniti'),
              actions: [
                TextButton(
                  child: Text('Nu'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    return await sendData();
                  },
                  child: Text('Trimiteti'),
                )
              ],
            )
          : AlertDialog(
              title: Text('Vreti sa trimiteti formularul?'),
              content: Text(
                  'Verificati ca toate datele sa fie corecte!\nDaca sunt corecte apasati pe Trimite\nDaca vreti sa faceti modificari apasati pe nu si reveniti'),
              actions: [
                TextButton(
                  child: Text('Nu'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    return await sendData();
                  },
                  child: Text('Trimiteti'),
                )
              ],
            );
    }

    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NameTextField(),
            InstitutionDropDown(),
            TypeDropDown(),
            SubjectTextField(),
            DescriptionTextField(),
            PhoneNumberTextField(),
            EmailTextField(),
            LocationSwitch(
              sendButtonLoadingState: sendButtonLoadingState,
            ),
            ImagePickerField(),
            Container(
              width: MediaQuery.of(context).size.width,
              child: context.watch<SendButtonLoadingState>().isLoading
                  ? TextButton(
                      onPressed: () => DoNothingAction(),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        primary: Colors.white,
                      ),
                      child: Platform.isAndroid
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : CupertinoActivityIndicator(),
                    )
                  : TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        primary: Colors.white,
                      ),
                      child: Text('Trimite'),
                      onPressed: () async {
                        {
                          if (_formKey.currentState.validate()) {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  showConfirmDialog(_formKey);
                                });
                          }
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
