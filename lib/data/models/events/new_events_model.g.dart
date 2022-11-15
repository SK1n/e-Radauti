// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewEventsModel _$NewEventsModelFromJson(Map<String, dynamic> json) =>
    NewEventsModel(
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => EventsListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewEventsModelToJson(NewEventsModel instance) =>
    <String, dynamic>{
      'events': instance.events,
    };
