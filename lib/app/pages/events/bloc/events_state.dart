part of 'events_bloc.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState({
    List<EventsItemModel>? newEvents,
    @Default(PageState.initial) PageState newEventsStatus,
    List<EventsItemModel>? oldEvents,
    @Default(PageState.initial) PageState oldEventsStatus,
    List<EventsItemModel>? favoritesEvents,
    @Default(PageState.initial) PageState floorStatus,
    String? errorMessage,
  }) = _EventsState;
}
