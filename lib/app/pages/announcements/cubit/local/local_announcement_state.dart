part of 'local_announcement_cubit.dart';

@freezed
class LocalAnnouncementState with _$LocalAnnouncementState {
  const factory LocalAnnouncementState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<LocalAnnouncementsItemModel> data,
    @Default('') String errorMessage,
  }) = _LocalAnnouncementState;
}
