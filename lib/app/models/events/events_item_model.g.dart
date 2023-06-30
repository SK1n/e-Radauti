// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventsItemModel _$$_EventsItemModelFromJson(Map<String, dynamic> json) =>
    _$_EventsItemModel(
      id: json['id'] as int?,
      category: json['category'] as String,
      description: json['description'] as String,
      headline: json['headline'] as String,
      location: json['location'] as String,
      host: json['host'] as String,
      street: json['street'] as String,
      start: json['start'] as int,
      end: json['end'] as int,
      url: json['URL'] as String,
    );

Map<String, dynamic> _$$_EventsItemModelToJson(_$_EventsItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'headline': instance.headline,
      'location': instance.location,
      'host': instance.host,
      'street': instance.street,
      'start': instance.start,
      'end': instance.end,
      'URL': instance.url,
    };
