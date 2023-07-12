part of 'public_cubit.dart';

@freezed
class PublicState with _$PublicState {
  const factory PublicState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<PublicItemModel> data,
    @Default('') String errorMessage,
  }) = _PublicState;
}
