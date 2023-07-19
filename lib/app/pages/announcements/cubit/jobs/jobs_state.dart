part of 'jobs_cubit.dart';

@freezed
class JobsState with _$JobsState {
  const factory JobsState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<ERadautiWebsiteRecordsModel> data,
    @Default('') String errorMessage,
  }) = _JobsState;
}
