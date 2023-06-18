part of 'events_bloc.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState({
    List<EventsItemModel>? newEvents,
    @Default(FirestoreSubmissionStatus.initial)
    FirestoreSubmissionStatus newEventsStatus,
    List<EventsItemModel>? oldEvents,
    @Default(FirestoreSubmissionStatus.initial)
    FirestoreSubmissionStatus oldEventsStatus,
    List<EventsItemModel>? favoritesEvents,
    @Default(FloorRepositoryStatus.initial) FloorRepositoryStatus floorStatus,
    String? errorMessage,
  }) = _EventsState;
}
