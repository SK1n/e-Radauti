part of 'events_bloc.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState({
    @Default([]) List<EventModel> newEvents,
    @Default(PageState.initial) PageState newEventsStatus,
    @Default('') String errorMessageNew,
    @Default([]) List<EventModel> oldEvents,
    @Default(PageState.initial) PageState oldEventsStatus,
    @Default('') String errorMessageOld,
    @Default([]) List<EventModel> favoriteEvents,
    @Default(PageState.initial) PageState favoriteStatus,
    @Default('') String errorMessageFavorites,
    @Default(false) bool isAnnonymous,
  }) = _EventsState;
}
