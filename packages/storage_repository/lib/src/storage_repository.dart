import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

enum StorageRepositoryStatus {
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

extension StorageReposityStatusX on StorageRepositoryStatus {
  bool get isInitial => this == StorageRepositoryStatus.initial;

  bool get isInProgress => this == StorageRepositoryStatus.inProgress;

  bool get isSuccess => this == StorageRepositoryStatus.success;

  bool get isFailure => this == StorageRepositoryStatus.failure;

  bool get isCanceled => this == StorageRepositoryStatus.canceled;

  bool get isInProgressOrSuccess => isInProgress || isSuccess;
}

class StorageFailure implements Exception {
  const StorageFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// The associated error [message].
  final String message;
}

class StorageException implements Exception {
  const StorageException([
    this.message = 'An unknown exception occurred.',
  ]);

  /// The associated error [message].
  final String message;
}

class StorageRepository {
  StorageRepository({
    FirebaseStorage? firebaseFirestore,
  }) : _firebaseStorage = firebaseFirestore ?? FirebaseStorage.instance;

  final FirebaseStorage _firebaseStorage;

  Logger log = Logger();

  Future<List<String>> uploadFiles(String path, List<dynamic>? files) async {
    try {
      List<String> downloadFilesLink = [];
      for (dynamic file in files!) {
        Reference ref = _firebaseStorage.ref().child(
            '$path/${DateTime.now().millisecondsSinceEpoch.toString() + Random().nextInt(3000).toString()}');
        UploadTask uploadTask;
        File newFile = File(file.path);
        uploadTask = ref.putFile(newFile);
        var link = await (await uploadTask).ref.getDownloadURL();
        downloadFilesLink.add(link);
      }
      return downloadFilesLink;
    } on FirebaseException catch (e) {
      throw StorageException(e.message.toString());
    } catch (_) {
      throw StorageException();
    }
  }

  Future<String> getFileDownloadUrl(String path) async =>
      await FirebaseStorage.instance.refFromURL(path).getDownloadURL();
}
