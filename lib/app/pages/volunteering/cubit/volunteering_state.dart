part of 'volunteering_cubit.dart';

@freezed
class VolunteeringState with _$VolunteeringState {
  const factory VolunteeringState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<VolunteeringItemModel> data,
    @Default('') String errorMessage,
  }) = _VolunteeringState;
}
