part of 'report_problem_cubit.dart';

final class ReportProblemState extends Equatable {
  const ReportProblemState({
    this.markers,
    this.isLoading = false,
    this.firestoreStatus = FirestoreRepositoryStatus.initial,
    this.storageStatus = StorageRepositoryStatus.initial,
    this.username = const Username.pure(),
    this.category = const Dropdown.pure(),
    this.institution = const Dropdown.pure(),
    this.subject = const Subject.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.email = const Email.pure(),
    this.imagePicker = const ImagePicker.pure(),
    this.description = const Description.pure(),
    this.isValid = false,
    this.errorMessage,
    this.formzStatus = FormzSubmissionStatus.initial,
  });

  final List<Marker>? markers;
  final bool isLoading;
  final FirestoreRepositoryStatus firestoreStatus;
  final StorageRepositoryStatus storageStatus;
  final Username username;
  final Dropdown category;
  final Dropdown institution;
  final Subject subject;
  final Description description;
  final PhoneNumber phoneNumber;
  final Email email;
  final ImagePicker imagePicker;
  final bool isValid;
  final String? errorMessage;
  final FormzSubmissionStatus formzStatus;

  @override
  List<Object?> get props => [
        markers,
        isLoading,
        firestoreStatus,
        storageStatus,
        username,
        category,
        institution,
        subject,
        phoneNumber,
        email,
        imagePicker,
        isValid,
        errorMessage,
        formzStatus,
        description
      ];

  ReportProblemState copyWith({
    List<Marker>? markers,
    bool? isLoading,
    FirestoreRepositoryStatus? firestoreStatus,
    StorageRepositoryStatus? storageStatus,
    Username? username,
    Dropdown? category,
    Dropdown? institution,
    Subject? subject,
    PhoneNumber? phoneNumber,
    Email? email,
    Description? description,
    ImagePicker? imagePicker,
    bool? isValid,
    String? errorMessage,
    FormzSubmissionStatus? formzStatus,
  }) =>
      ReportProblemState(
        markers: markers ?? this.markers,
        isLoading: isLoading ?? this.isLoading,
        firestoreStatus: firestoreStatus ?? this.firestoreStatus,
        storageStatus: storageStatus ?? this.storageStatus,
        username: username ?? this.username,
        category: category ?? this.category,
        institution: institution ?? this.institution,
        subject: subject ?? this.subject,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        imagePicker: imagePicker ?? this.imagePicker,
        isValid: isValid ?? this.isValid,
        errorMessage: errorMessage ?? this.errorMessage,
        formzStatus: formzStatus ?? this.formzStatus,
        description: description ?? this.description,
      );
}
