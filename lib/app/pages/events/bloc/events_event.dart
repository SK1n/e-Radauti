part of 'events_bloc.dart';

sealed class EventsEvent {
  const EventsEvent();
}

final class GetNewEvents extends EventsEvent {
  const GetNewEvents();
}

final class GetOldEvents extends EventsEvent {
  const GetOldEvents();
}

final class GetFavoriteEvents extends EventsEvent {
  const GetFavoriteEvents();
}

final class EmitFavoriteEventsChanges extends EventsEvent {
  const EmitFavoriteEventsChanges(this.items);
  final List<EventModel> items;
}

final class AddToFavorite extends EventsEvent {
  const AddToFavorite(this.item);
  final EventModel item;
}

final class RemoveFromFavorite extends EventsEvent {
  const RemoveFromFavorite(this.item);
  final EventModel item;
}
