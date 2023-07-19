part of 'local_council_team_cubit.dart';

@freezed
class LocalCouncilTeamState with _$LocalCouncilTeamState {
  const factory LocalCouncilTeamState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<LocalCouncilItemModel> data,
    @Default('') String errorMessage,
  }) = _LocalCouncilTeamState;
}
