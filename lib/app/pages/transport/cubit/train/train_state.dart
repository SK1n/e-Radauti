part of 'train_cubit.dart';

@freezed
class TrainState with _$TrainState {
  const factory TrainState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<TrainItemModel> data,
    @Default('') String errorMessage,
  }) = _TrainState;
}
