part of 'events_bloc.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState({
    @Default([]) List<EventsItemModel> newEvents,
    @Default(PageState.initial) PageState newEventsStatus,
    @Default('') String errorMessageNew,
    @Default([]) List<EventsItemModel> oldEvents,
    @Default(PageState.initial) PageState oldEventsStatus,
    @Default('') String errorMessageOld,
    @Default([]) List<EventsItemModel> favoriteEvents,
    @Default(PageState.initial) PageState favoriteStatus,
    @Default('') String errorMessageFavorites,
  }) = _EventsState;
}
