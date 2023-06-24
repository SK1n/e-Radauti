part of 'local_administration_cubit.dart';

@freezed
class LocalAdministrationState with _$LocalAdministrationState {
  const factory LocalAdministrationState({
    //Latest NEWS
    required PageState newsState,
    required DecisionModel latestDecision,
    required String? errorMessageNews,
    //Local decisions
    required PageState localDecisionState,
    required List<DecisionModel> localDecisions,
    required List<DecisionModel> fillteredLocalDecisions,
    required String? errorMessageLocalDecisions,
  }) = _LocalAdministrationState;

  factory LocalAdministrationState.initial() => const LocalAdministrationState(
        newsState: PageState.initial,
        latestDecision: DecisionModel(
          title: '',
          url: '',
          year: '',
        ),
        errorMessageNews: '',
        localDecisionState: PageState.initial,
        localDecisions: [],
        fillteredLocalDecisions: [],
        errorMessageLocalDecisions: '',
      );
}
