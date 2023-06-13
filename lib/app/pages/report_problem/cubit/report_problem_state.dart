part of 'report_problem_cubit.dart';

@freezed
class ReportProblemState with _$ReportProblemState {
  const factory ReportProblemState({
    required Username username,
    required Email email,
    required Subject subject,
    required Description description,
    required Institution institution,
    required Category category,
    required PhoneNumber phoneNumber,
    required GenericInput<bool> locationEnabled,
    required ImagePicker imagePicker,
    required bool isValid,
    required FormzSubmissionStatus formzStatus,
    required String errorMessage,
    required Position? position,
  }) = _ReportProblemState;

  factory ReportProblemState.initial() => ReportProblemState(
        username: const Username.pure(),
        email: const Email.pure(),
        locationEnabled: const GenericInput<bool>.pure(false),
        subject: const Subject.pure(),
        description: const Description.pure(),
        institution: const Institution.pure(),
        category: const Category.pure(),
        phoneNumber: const PhoneNumber.pure(),
        imagePicker: ImagePicker.pure(),
        isValid: false,
        errorMessage: "Sorry something went wrong",
        formzStatus: FormzSubmissionStatus.initial,
        position: null,
      );
}
