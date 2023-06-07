import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_failure_or_success.freezed.dart';

@freezed
abstract class FirestoreFailureOrSuccess with _$FirestoreFailureOrSuccess {
  const factory FirestoreFailureOrSuccess.none() = None;
  const factory FirestoreFailureOrSuccess.success() = Success;
  const factory FirestoreFailureOrSuccess.weakPassword() = WeakPassword;
  const factory FirestoreFailureOrSuccess.serverError() = ServerError;
  const factory FirestoreFailureOrSuccess.emailAlreadyInUse() =
      EmailAlreadyInUse;
  const factory FirestoreFailureOrSuccess.invalidEmailAndPassword() =
      InvalidEmailAndPassword;
}
