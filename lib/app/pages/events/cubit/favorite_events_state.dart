part of 'favorite_events_cubit.dart';

final class FavoriteEventsState extends Equatable {
  const FavoriteEventsState({
    this.events,
    this.status = FloorRepositoryStatus.initial,
    this.errorMessage,
  });

  final List<EventsItemModel>? events;
  final FloorRepositoryStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [events, status, errorMessage];

  FavoriteEventsState copyWith({
    List<EventsItemModel>? events,
    FloorRepositoryStatus? status,
    String? errorMessage,
  }) =>
      FavoriteEventsState(
          events: events ?? this.events,
          status: status ?? this.status,
          errorMessage: errorMessage ?? this.errorMessage);
}
