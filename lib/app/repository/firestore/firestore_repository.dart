import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapperadauti/app/models/report_problem/report_problem_model.dart';

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

  Stream getDataStream(String path) {
    var document = _firestore.doc(path).snapshots();

    return document;
  }

  Stream<DocumentSnapshot> fetchDocumentStream(String path) {
    return FirebaseFirestore.instance.doc(path).snapshots();
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

  Future addDocument(String collection, dynamic data) async {
    try {
      Map<String, dynamic> mapData = data.toJson();
      await _firestore.collection(collection).add(mapData);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future getDocuments(String collection, Function convert) async {
    List data = [];
    try {
      QuerySnapshot snapshot = await _firestore.collection(collection).get();

      for (var element in snapshot.docs) {
        var convertedElement = convert(element.data());
        data.add(convertedElement);
      }
      return data;
    } on Exception catch (e) {
      debugPrint(e.toString());
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
        Map<String, dynamic> eventMap = elementsToAdd[0].toJson();
        updatedArray.add(eventMap);
      }

      if (elementsToRemove != null) {
        Map<String, dynamic> eventMap = elementsToRemove[0].toJson();

        updatedArray.removeWhere((element) {
          return eventMap["description"] == element["description"];
        });
      }

      await docRef.update({arrayField: updatedArray});
    } catch (e) {
      throw FirestoreArrayUpdateFailure('Failed to update array field: $e');
    }
  }
}
