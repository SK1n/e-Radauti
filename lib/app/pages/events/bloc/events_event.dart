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
