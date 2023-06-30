// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_item_model2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventsItemModel2 _$EventsItemModel2FromJson(Map<String, dynamic> json) =>
    EventsItemModel2(
      json['category'] as String,
      json['description'] as String,
      json['headline'] as String,
      json['location'] as String,
      json['host'] as String,
      json['street'] as String,
      json['start'] as int,
      json['end'] as int,
      json['URL'] as String,
      json['id'] as int?,
    );

Map<String, dynamic> _$EventsItemModel2ToJson(EventsItemModel2 instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'headline': instance.headline,
      'location': instance.location,
      'host': instance.host,
      'street': instance.street,
      'start': instance.start,
      'end': instance.end,
      'URL': instance.url,
      'id': instance.id,
    };
