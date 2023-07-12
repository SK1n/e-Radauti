part of 'furniture_cubit.dart';

@freezed
class FurnitureState with _$FurnitureState {
  const factory FurnitureState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<ERadautiWebsiteRecordsModel> data,
    @Default('') String errorMessage,
  }) = _FurnitureState;
}
