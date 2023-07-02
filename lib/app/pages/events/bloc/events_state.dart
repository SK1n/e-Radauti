part of 'events_bloc.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState({
    List<EventsItemModel>? newEvents,
    @Default(PageState.initial) PageState newEventsStatus,
    String? errorMessageNew,
    List<EventsItemModel>? oldEvents,
    @Default(PageState.initial) PageState oldEventsStatus,
    String? errorMessageOld,
    List<EventsItemModel>? favoriteEvents,
    @Default(PageState.initial) PageState favoriteStatus,
    String? errorMessageFavorites,
  }) = _EventsState;
}
