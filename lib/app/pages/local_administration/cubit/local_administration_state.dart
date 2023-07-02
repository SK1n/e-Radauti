part of 'local_administration_cubit.dart';

@freezed
class LocalAdministrationState with _$LocalAdministrationState {
  const factory LocalAdministrationState({
    //Latest NEWS
    @Default(PageState.initial) PageState newsState,
    DecisionModel? latestDecision,
    @Default('') String errorMessageNews,
    //Local decisions
    @Default(PageState.initial) PageState localDecisionState,
    @Default([]) List<DecisionModel> localDecisions,
    @Default([]) List<DecisionModel> fillteredLocalDecisions,
    @Default('') String errorMessageLocalDecisions,
    // Local council team
    @Default(PageState.initial) PageState localCouncilTeamState,
    @Default([]) List<LocalCouncilItemModel> localCouncilTeamList,
    @Default('') String errorMessageLocalCouncilTeam,
  }) = _LocalAdministrationState;
}
