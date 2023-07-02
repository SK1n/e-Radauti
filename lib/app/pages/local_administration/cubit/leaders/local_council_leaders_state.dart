part of 'local_council_leaders_cubit.dart';

@freezed
class LocalCouncilLeadersState with _$LocalCouncilLeadersState {
  const factory LocalCouncilLeadersState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<LocalCouncilLeadersItemModel> data,
    @Default('') String errorMessage,
  }) = _LocalCouncilLeadersState;
}
