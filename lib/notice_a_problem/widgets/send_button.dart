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
    IsLoading loadingScreen = Provider.of<IsLoading>(context, listen: false);

    DownloadableList downloadableList =
        Provider.of<DownloadableList>(context, listen: false);
    LocationSwitchState locationSwitchState =
        Provider.of<LocationSwitchState>(context, listen: false);
    NoticeFormState noticeFormState =
        Provider.of<NoticeFormState>(context, listen: false);
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
                  final firestoreInstance = FirebaseFirestore.instance;
                  loadingScreen.changeLoadingState();
                  try {
                    await Future.forEach(
                        formKey.currentState.fields['image'].value,
                        (element) async => uploadImageToFirebase(
                            context, element, downloadableList));

                    var data = [
                      {
                        "category": noticeFormState.category,
                        "description": noticeFormState.description,
                        "index": noticeFormState.index,
                        "institution": noticeFormState.institution,
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
                      }
                    ];
                    CollectionReference collectionReference =
                        firestoreInstance.collection('collection');
                    DocumentReference documentReference =
                        collectionReference.doc('Markers');
                    await documentReference.update(
                        {"markers": FieldValue.arrayUnion(data)}).then((value) {
                      //  formKey.currentState.reset();
                      resetData(noticeFormState);
                      locationSwitchState.updateState(false);
                      downloadableList.deleteList();
                      loadingScreen.changeLoadingState();
                      print('added');
                      ScaffoldMessenger.of(scaffoldState.currentContext)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text('Reusit'),
                          backgroundColor: Colors.greenAccent,
                        ));
                    });
                  } on Exception catch (e) {
                    ScaffoldMessenger.of(scaffoldState.currentContext)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        content: Text('Esuat'),
                        backgroundColor: Colors.redAccent,
                      ));
                    debugPrint('$e');
                  }
                }
              }
            },
          );
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
