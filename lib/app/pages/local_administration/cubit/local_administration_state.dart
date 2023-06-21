part of 'local_administration_cubit.dart';

@freezed
class LocalAdministrationState with _$LocalAdministrationState {
  const factory LocalAdministrationState({
    required NewsState newsState,
    required DecisionModel latestDecision,
    String? message,
  }) = _LocalAdministrationState;

  factory LocalAdministrationState.initial() => const LocalAdministrationState(
        newsState: NewsState.initial,
        latestDecision: DecisionModel(
          title: '',
          url: '',
          year: '',
        ),
        message: '',
      );
}
