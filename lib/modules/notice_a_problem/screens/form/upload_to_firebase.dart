import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutterapperadauti/controllers/location_controller.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/screens/form/controllers/form_controller.dart';
import 'package:get/get.dart';

class UploadToFirebase {
  final NoticeProblemController _noticeProblemController =
      Get.find<NoticeProblemController>();
  final LocationController _locationController = Get.find<LocationController>();
  final _firestoreInstance = FirebaseFirestore.instance;
  void uploadToFirebase() {
    if (_noticeProblemController.formKey.currentState!.validate()) {
      _noticeProblemController.formKey.currentState!.save();
      Get.defaultDialog(
          title: 'Vreti sa trimiteti formularul?',
          content: Text('Verificati ca toate datele sa fie corecte!'),
          actions: [
            TextButton(
              onPressed: () async {
                Get.back();
                EasyLoading.show();
                await Future.forEach(
                  _noticeProblemController
                      .formKey.currentState!.fields['ImagePicker']?.value,
                  (element) async => _uploadImageToFirebase(element),
                );
                var data = [
                  {
                    "category": _noticeProblemController
                        .formKey.currentState!.fields['category']?.value,
                    "description": _noticeProblemController
                        .formKey.currentState!.fields['description']?.value,
                    "index": _getIndex(_noticeProblemController
                        .formKey.currentState!.fields['index']?.value),
                    "institution": _noticeProblemController.formKey
                        .currentState!.fields['institution_email']?.value,
                    "institution_email": _noticeProblemController
                        .getInstitutionEmail(_noticeProblemController.formKey
                            .currentState?.fields['institution_email']?.value),
                    "lat": _noticeProblemController.useLocation.value
                        ? await _locationController.getLatitute()
                        : null,
                    "long": _noticeProblemController.useLocation.value
                        ? await _locationController.getLongitude()
                        : null,
                    "status": "În lucru",
                    "subject": _noticeProblemController
                        .formKey.currentState!.fields['subject']?.value,
                    "email": _noticeProblemController
                        .formKey.currentState!.fields['email']?.value,
                    "name": _noticeProblemController
                        .formKey.currentState!.fields['name']?.value,
                    "url": _noticeProblemController.imageLinks,
                    "phone": _noticeProblemController
                        .formKey.currentState!.fields['phone']?.value,
                  }
                ];
                CollectionReference collectionReference =
                    _firestoreInstance.collection('collection');
                DocumentReference documentReference =
                    collectionReference.doc('MarkersTest');
                await documentReference.update(
                    {"markers": FieldValue.arrayUnion(data)}).then((value) {
                  EasyLoading.showSuccess('Success').then((value) {
                    _noticeProblemController.formKey.currentState!.reset();
                    _noticeProblemController.imageLinks = [];
                    _noticeProblemController.useLocation.value = false;
                  });
                }).onError((error, stackTrace) {
                  EasyLoading.showError('Eroare').then(
                    (value) => _noticeProblemController.imageLinks = [],
                  );
                });
              },
              child: Text('Trimite'),
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'),
            ),
          ]);
    }
  }

  Future<void> _uploadImageToFirebase(dynamic file) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(
        'Notice_A_Problem/${DateTime.now().millisecondsSinceEpoch.toString() + Random().nextInt(3000).toString()}');
    try {
      UploadTask uploadTask;
      File newFile = File(file.path);
      uploadTask = ref.putFile(newFile);
      _noticeProblemController
          .addImageLink(await (await uploadTask).ref.getDownloadURL());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  int _getIndex(String text) {
    switch (text) {
      case 'Altele':
        return 0;

      case 'Gunoi neridicat':
        return 1;

      case 'Infrastructură':
        return 2;

      case 'Probleme la utilitati':
        return 3;

      case 'Constructii ilegale':
        return 4;

      case 'Siguranta':
        return 5;

      case 'Calitatea aerului si poluare':
        return 6;

      default:
        return 0;
    }
  }
}
