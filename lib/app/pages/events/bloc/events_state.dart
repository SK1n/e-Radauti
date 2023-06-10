part of 'events_bloc.dart';

final class EventsState extends Equatable {
  const EventsState({
    this.events,
    this.status = FirestoreRepositoryStatus.initial,
    this.errorMessage,
  });

  final List<EventsItemModel>? events;
  final FirestoreRepositoryStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [events, status, errorMessage];

  EventsState copyWith({
    List<EventsItemModel>? events,
    FirestoreRepositoryStatus? status,
    String? errorMessage,
  }) =>
      EventsState(
          events: events ?? this.events,
          status: status ?? this.status,
          errorMessage: errorMessage ?? this.errorMessage);
}
