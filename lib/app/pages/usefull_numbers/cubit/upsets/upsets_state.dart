part of 'upsets_cubit.dart';

@freezed
class UpsetsState with _$UpsetsState {
  const factory UpsetsState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<UpsetsItemModel> data,
    @Default('') String errorMessage,
  }) = _UpsetsState;
}
