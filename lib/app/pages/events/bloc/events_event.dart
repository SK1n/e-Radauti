part of 'events_bloc.dart';

sealed class EventsEvent {
  const EventsEvent();
}

final class GetEvents extends EventsEvent {
  const GetEvents();
}
