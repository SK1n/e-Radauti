part of 'report_problem_cubit.dart';

enum PositionState {
  success,
  failure,
  initial,
  inProgress,
  denied,
  deniedForever,
  disabled,
}

extension PositionStateX on PositionState {
  bool get isSuccess => this == PositionState.success;
  bool get isInProgress => this == PositionState.inProgress;
  bool get isDenied => this == PositionState.denied;
  bool get isDeniedForever => this == PositionState.deniedForever;
  bool get isInitial => this == PositionState.initial;
  bool get isDisabled => this == PositionState.disabled;
  bool get isFailure => this == PositionState.failure;
}

@freezed
class ReportProblemState with _$ReportProblemState {
  const factory ReportProblemState({
    required ReportProblemForm form,
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
        form: ReportProblemForm(),
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
