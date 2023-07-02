part of 'local_decisions_cubit.dart';

@freezed
class LocalDecisionsState with _$LocalDecisionsState {
  const factory LocalDecisionsState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<DecisionModel> data,
    @Default([]) List<DecisionModel> dataFilter,
    @Default('') String errorMessage,
  }) = _LocalDecisionsCubit;
}
