part of 'report_problem_cubit.dart';

enum PositionState {
  success,
  initial,
  denied,
  deniedForever,
  disabled,
}

extension PositionStateX on PositionState {
  bool get isSuccess => this == PositionState.success;
  bool get isDenied => this == PositionState.denied;
  bool get isDeniedForever => this == PositionState.deniedForever;
  bool get isInitial => this == PositionState.initial;
  bool get isDisabled => this == PositionState.disabled;
}

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
    required PageState storageStatus,
    required PageState firestoreStatus,
    required List<ReportProblemUserItemModel> myReportsData,
    required List<Marker>? markersData,
    required String? errorMessage,
    required Position? position,
    required PositionState positionState,
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
        myReportsData: [],
        markersData: [],
        position: null,
        storageStatus: PageState.initial,
        firestoreStatus: PageState.initial,
        positionState: PositionState.initial,
      );
}
