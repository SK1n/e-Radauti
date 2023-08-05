// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'events_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventsItemModel _$$_EventsItemModelFromJson(Map<String, dynamic> json) =>
    _$_EventsItemModel(
      category: json['category'] as String? ?? '',
      description: json['description'] as String? ?? '',
      headline: json['headline'] as String? ?? '',
      location: json['location'] as String? ?? '',
      url: json['URL'] as String? ?? '',
      host: json['host'] as String? ?? '',
      street: json['street'] as String? ?? '',
      start: json['start'] as int? ?? 0,
      end: json['end'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$$_EventsItemModelToJson(_$_EventsItemModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'headline': instance.headline,
      'location': instance.location,
      'URL': instance.url,
      'host': instance.host,
      'street': instance.street,
      'start': instance.start,
      'end': instance.end,
      'id': instance.id,
    };
