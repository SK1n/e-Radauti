/// Enum representing the submission status for Firestore operations.
enum FirestoreSubmissionStatus {
  /// The operation has not yet been submitted.
  initial,

  /// The operation is in progress.
  inProgress,

  /// The operation was completed successfully.
  success,

  /// The operation failed.
  failure,

  /// The operation has been canceled.
  canceled,
}

/// Useful extensions on [FirestoreSubmissionStatus]
extension FirestoreSubmissionStatusX on FirestoreSubmissionStatus {
  /// Indicates whether the operation has not yet been submitted.
  bool get isInitial => this == FirestoreSubmissionStatus.initial;

  /// Indicates whether the operation is in progress.
  bool get isInProgress => this == FirestoreSubmissionStatus.inProgress;

  /// Indicates whether the operation was completed successfully.
  bool get isSuccess => this == FirestoreSubmissionStatus.success;

  /// Indicates whether the operation failed.
  bool get isFailure => this == FirestoreSubmissionStatus.failure;

  /// Indicates whether the operation has been canceled.
  bool get isCanceled => this == FirestoreSubmissionStatus.canceled;

  /// Indicates whether the operation is either in progress or was completed successfully.
  ///
  /// This is useful for showing a loading indicator or disabling certain actions
  /// while the operation is ongoing.
  bool get isInProgressOrSuccess => isInProgress || isSuccess;
}
