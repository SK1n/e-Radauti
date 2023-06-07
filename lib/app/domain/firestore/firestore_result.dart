import 'package:flutterapperadauti/app/infrastructure/auth/auth_failure_or_success.dart';
import 'package:flutterapperadauti/app/infrastructure/firestore/firestore_failure_or_success.dart';

class FirestoreResult {
  final bool isSuccess;
  final FirestoreFailureOrSuccess firestoreFailureOrSuccess;

  FirestoreResult({
    required this.firestoreFailureOrSuccess,
    required this.isSuccess,
  });
}
