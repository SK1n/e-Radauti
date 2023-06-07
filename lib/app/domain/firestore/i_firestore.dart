import 'package:flutterapperadauti/app/domain/firestore/firestore_result.dart';
import 'package:flutterapperadauti/data/models/user/user_model.dart';

abstract class IFirestore {
  Future<FirestoreResult> createUserDocument({
    required String uid,
    required UserModel userModel,
  });
}
