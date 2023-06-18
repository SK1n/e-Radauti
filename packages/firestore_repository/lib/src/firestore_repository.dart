import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floor/floor.dart';

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

/// Thrown during the Firestore document fetch process if a failure occurs.
class FirestoreFetchFailure implements Exception {
  /// Create a Firestore fetch failure with the specified [message].
  const FirestoreFetchFailure(this.message);

  /// The associated error message.
  final String message;
}

/// Thrown during the Firestore document creation process if a failure occurs.
class FirestoreCreateFailure implements Exception {
  /// Create a Firestore create failure with the specified [message].
  const FirestoreCreateFailure(this.message);

  /// The associated error message.
  final String message;
}

/// Thrown during the Firestore document update process if a failure occurs.
class FirestoreUpdateFailure implements Exception {
  /// Create a Firestore update failure with the specified [message].
  const FirestoreUpdateFailure(this.message);

  /// The associated error message.
  final String message;
}

/// Thrown during the Firestore document deletion process if a failure occurs.
class FirestoreDeleteFailure implements Exception {
  /// Create a Firestore delete failure with the specified [message].
  const FirestoreDeleteFailure(this.message);

  /// The associated error message.
  final String message;
}

/// Thrown during the Firestore array update process if a failure occurs.
class FirestoreArrayUpdateFailure implements Exception {
  /// Create a Firestore array update failure with the specified [message].
  const FirestoreArrayUpdateFailure(this.message);

  /// The associated error message.
  final String message;
}

/// Repository for managing Firestore operations.
class FirestoreRepository {
  /// Creates a new instance of [FirestoreRepository].
  FirestoreRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  /// Fetches a document from Firestore at the specified [path].
  ///
  /// Throws a [FirestoreFetchFailure] if an exception occurs.
  Future<DocumentSnapshot<Map<String, dynamic>>> fetchDocument(
      String path) async {
    try {
      final snapshot = await _firestore.doc(path).get();
      return snapshot;
    } catch (e) {
      throw FirestoreFetchFailure('Failed to fetch document: $e');
    }
  }

  /// Creates a new document in Firestore at the specified [path] with the given [data].
  ///
  /// Throws a [FirestoreCreateFailure] if an exception occurs.
  Future<void> createDocument(String path, Map<String, dynamic> data) async {
    try {
      await _firestore.doc(path).set(data);
    } catch (e) {
      throw FirestoreCreateFailure('Failed to create document: $e');
    }
  }

  /// Updates an existing document in Firestore at the specified [path] with the given [data].
  ///
  /// Throws a [FirestoreUpdateFailure] if an exception occurs.
  Future<void> updateDocument(String path, Map<String, dynamic> data) async {
    try {
      await _firestore.doc(path).update(data);
    } catch (e) {
      throw FirestoreUpdateFailure('Failed to update document: $e');
    }
  }

  /// Deletes a document from Firestore at the specified [path].
  ///
  /// Throws a [FirestoreDeleteFailure] if an exception occurs.
  Future<void> deleteDocument(String path) async {
    try {
      await _firestore.doc(path).delete();
    } catch (e) {
      throw FirestoreDeleteFailure('Failed to delete document: $e');
    }
  }

  /// Updates an array field in a document in Firestore at the specified [path]
  /// by adding or removing elements based on the provided [elementsToAdd] and [elementsToRemove].
  ///
  /// Throws a [FirestoreArrayUpdateFailure] if an exception occurs.
  Future<void> updateArrayField(
    String path,
    String arrayField, {
    List<dynamic>? elementsToAdd,
    List<dynamic>? elementsToRemove,
  }) async {
    try {
      final docRef = _firestore.doc(path);
      final snapshot = await docRef.get();
      final currentArray = snapshot.get(arrayField) as List<dynamic>;

      final updatedArray = List<dynamic>.from(currentArray);

      if (elementsToAdd != null) {
        updatedArray.addAll(elementsToAdd);
      }

      if (elementsToRemove != null) {
        updatedArray
            .removeWhere((element) => elementsToRemove.contains(element));
      }

      await docRef.update({arrayField: updatedArray});
    } catch (e) {
      throw FirestoreArrayUpdateFailure('Failed to update array field: $e');
    }
  }
}
