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
    @Default(ReportProblemForm()) final ReportProblemForm form,
    @Default(FormzSubmissionStatus.initial)
    final FormzSubmissionStatus formzStatus,
    @Default(PageState.initial) final PageState storageStatus,
    @Default(PageState.initial) final PageState firestoreStatus,
    @Default([]) final List<ReportProblemUserItemModel> myReportsData,
    @Default([]) final List<Marker>? markersData,
    @Default('') final String errorMessage,
    final Position? position,
    @Default(PositionState.initial) final PositionState positionState,
  }) = _ReportProblemState;
}
