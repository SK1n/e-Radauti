import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/notice_a_problem/location_switch.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/image_picker_field.dart';
import 'package:flutterapperadauti/state/loading_state.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:provider/provider.dart';

class SendButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final GlobalKey<ScaffoldState> scaffoldState;
  final bool disabled;
  const SendButton(
      {Key key, this.formKey, this.disabled = false, this.scaffoldState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<SendButtonLoadingState>().isLoading
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
                if (formKey.currentState.validate()) {
                  showDialog(
                      context: context,
                      builder: (_) => showConfirmDialog(context));
                }
              }
            },
          );
  }

  showConfirmDialog(BuildContext context) {
    return Platform.isIOS
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
                onPressed: () {
                  sendData();
                  Navigator.pop(context);
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
                onPressed: () {
                  sendData(context: context);
                  Navigator.pop(context);
                },
                child: Text('Trimiteti'),
              )
            ],
          );
  }

  sendData({BuildContext context}) async {
    final firestoreInstance = FirebaseFirestore.instance;
    IsLoading loadingScreen =
        Provider.of<IsLoading>(scaffoldState.currentContext, listen: false);
    DownloadableList downloadableList =
        Provider.of<DownloadableList>(context, listen: false);
    LocationSwitchState locationSwitchState =
        Provider.of<LocationSwitchState>(context, listen: false);
    NoticeFormState noticeFormState =
        Provider.of<NoticeFormState>(context, listen: false);
    loadingScreen.changeLoadingState();
    try {
      await Future.forEach(
          formKey.currentState.fields['image'].value,
          (element) async =>
              uploadImageToFirebase(context, element, downloadableList));

      var data = [
        {
          "category": noticeFormState.category,
          "description": noticeFormState.description,
          "index": noticeFormState.index,
          "institution": noticeFormState.institution,
          "institution_email": noticeFormState.institutionEmail,
          "lat": locationSwitchState.value
              ? noticeFormState.position.latitude
              : null,
          "long": locationSwitchState.value
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
      DocumentReference documentReference = collectionReference.doc('Markers');
      CollectionReference collectionReferenceNotifications =
          firestoreInstance.collection('notifications');
      DocumentReference documentReferenceNotifications =
          collectionReferenceNotifications.doc('Sesizari');
      await documentReferenceNotifications
          .update({"sesizari": FieldValue.arrayUnion(data)});
      await documentReference
          .update({"markers": FieldValue.arrayUnion(data)}).then((value) {
        //  formKey.currentState.reset();

        resetData(noticeFormState);
        locationSwitchState.updateState(false);
        downloadableList.deleteList();
        loadingScreen.changeLoadingState();
        print('added');
        ScaffoldMessenger.of(scaffoldState.currentContext)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text('Reusit. Vreti primi un email in cateva minute'),
            backgroundColor: Colors.greenAccent,
          ));
      });
    } on Exception catch (e) {
      loadingScreen.changeLoadingState();
      downloadableList.deleteList();
      ScaffoldMessenger.of(scaffoldState.currentContext)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('Esuat. Va rugam sa incercati din nou.'),
          backgroundColor: Colors.redAccent,
        ));
      debugPrint('$e');
    }
  }

  Future<void> uploadImageToFirebase(BuildContext context, dynamic file,
      DownloadableList downloadableList) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    Reference ref = storage.ref().child(
        'Notice_A_Problem/${DateTime.now().millisecondsSinceEpoch.toString() + Random().nextInt(3000).toString()}');
    UploadTask uploadTask;

    try {
      uploadTask = ref.putFile(file);
      await downloadableList
          .addLink(await (await uploadTask).ref.getDownloadURL());
    } catch (e) {
      debugPrint('upload:$e');
    }
  }

  void resetData(NoticeFormState noticeFormState) {
    noticeFormState.upIndex(0);
    noticeFormState.upDescription('');
    noticeFormState.upPhoneNumber('');
    noticeFormState.upEmail('');
    noticeFormState.upTypeName('Altele');
    noticeFormState.upName('');
    noticeFormState.getPosition(null);
    noticeFormState.upInstitutionEmail('');
    noticeFormState.upSubject('');
    noticeFormState.upInstitution('');
  }
}

class SendButtonLoadingState extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void updateState(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
