part of 'event_details_cubit.dart';

final class EventDetailsState extends Equatable {
  const EventDetailsState({
    this.isFavorite = false,
  });

  final bool isFavorite;

  EventDetailsState copyWith({bool? isFavorite = false}) =>
      EventDetailsState(isFavorite: isFavorite ?? this.isFavorite);

  @override
  List<Object?> get props => [isFavorite];
}
