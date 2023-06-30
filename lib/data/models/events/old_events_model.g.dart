// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old_events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OldEventsModel _$OldEventsModelFromJson(Map<String, dynamic> json) =>
    OldEventsModel(
      (json['oldEvents'] as List<dynamic>)
          .map((e) => EventsItemModel2.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OldEventsModelToJson(OldEventsModel instance) =>
    <String, dynamic>{
      'oldEvents': instance.events,
    };
