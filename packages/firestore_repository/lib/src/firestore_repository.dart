import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

enum FirestoreRepositoryStatus {
  /// The function has not yet been started.
  initial,

  /// The function is in the process.
  inProgress,

  /// The function ended successfully.
  success,

  /// The function ended with failed.
  failure,

  /// The function has been canceled.
  canceled
}

extension FirestoreReposityStatusX on FirestoreRepositoryStatus {
  bool get isInitial => this == FirestoreRepositoryStatus.initial;

  bool get isInProgress => this == FirestoreRepositoryStatus.inProgress;

  bool get isSuccess => this == FirestoreRepositoryStatus.success;

  bool get isFailure => this == FirestoreRepositoryStatus.failure;

  bool get isCanceled => this == FirestoreRepositoryStatus.canceled;

  bool get isInProgressOrSuccess => isInProgress || isSuccess;
}

class FirestoreException implements Exception {
  const FirestoreException([
    this.message = 'An unknown exception occurred.',
  ]);

  /// The associated error [message].
  final String message;
}

class FirestoreRepository {
  FirestoreRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firebaseFirestore;

  Logger log = Logger();

  /// Add new data to the document from [path] without deleting the old data
  ///
  /// Throws and [FirestoreFailure] if an exception occurs
  Future<void> addDataToDocument({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firebaseFirestore.doc(path).update(data);
    } on FirebaseException catch (e) {
      throw FirestoreException(e.message ?? "Unknown error");
    } catch (_) {
      throw const FirestoreException();
    }
  }

  /// Add [data] to the [array] from the document's [path]
  ///
  /// [array] the array to be modified
  ///
  /// [data] should be a json
  ///
  /// Throws and [FirestoreException] if an exception occurs
  Future<void> addDataToArray({
    required String path,
    required String array,
    required dynamic data,
  }) async {
    try {
      await _firebaseFirestore.doc(path).update({
        array: FieldValue.arrayUnion(data),
      });
    } on FirebaseException catch (e) {
      throw FirestoreException(e.message ?? "Unknown error");
    } catch (_) {
      throw const FirestoreException();
    }
  }

  /// Get data from the document's path
  ///
  /// [converter] convert firebase data to an object
  ///
  /// [array] the array where the list of objects are in the document
  ///
  /// Throws and [FirestoreException] if an exception occurs
  Future<dynamic> getDataFromDocumentArray({
    required String path,
    required Function converter,
  }) async {
    try {
      var snapshot = await _firebaseFirestore.doc(path).get();
      return converter(snapshot.data());
    } on FirebaseException catch (e) {
      throw FirestoreException(e.message ?? "Unknown error");
    } catch (error) {
      log.e(error.toString());
      throw const FirestoreException();
    }
  }
}
