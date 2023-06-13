part of 'events_bloc.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState({
    List<EventsItemModel>? events,
    @Default(FirestoreSubmissionStatus.initial)
    FirestoreSubmissionStatus status,
    @Default(FloorRepositoryStatus.initial) FloorRepositoryStatus floorStatus,
    String? errorMessage,
  }) = _EventsState;
}
