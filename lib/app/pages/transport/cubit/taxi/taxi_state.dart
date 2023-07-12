part of 'taxi_cubit.dart';

@freezed
class TaxiState with _$TaxiState {
  const factory TaxiState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<TaxiItemModel> data,
    @Default('') String errorMessage,
  }) = _TaxiState;
}
