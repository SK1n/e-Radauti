import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapperadauti/app/domain/firestore/firestore_result.dart';
import 'package:flutterapperadauti/app/domain/firestore/i_firestore.dart';
import 'package:flutterapperadauti/app/infrastructure/firestore/firestore_failure_or_success.dart';
import 'package:flutterapperadauti/data/models/user/user_model.dart';

class Firestore extends IFirestore {
  final FirebaseFirestore _firestore;
  Firestore(this._firestore);

  @override
  Future<FirestoreResult> createUserDocument(
      {required String uid, required UserModel userModel}) async {
    try {
      await _firestore.collection('users').doc(uid).set(userModel.toJson());
      return FirestoreResult(
        isSuccess: true,
        firestoreFailureOrSuccess: const FirestoreFailureOrSuccess.success(),
      );
    } on FirebaseException {
      return FirestoreResult(
        isSuccess: false,
        firestoreFailureOrSuccess:
            const FirestoreFailureOrSuccess.serverError(),
      );
    }
  }
}
