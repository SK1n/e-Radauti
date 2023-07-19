enum PageState {
  initial,
  inProgress,
  success,
  failure,
}

extension PageStateX on PageState {
  bool get isInitial => this == PageState.initial;
  bool get isInProgress => this == PageState.inProgress;
  bool get isSuccess => this == PageState.success;
  bool get isFalure => this == PageState.failure;
}
