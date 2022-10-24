// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventsListModel _$EventsListModelFromJson(Map<String, dynamic> json) =>
    EventsListModel(
      category: json['category'] as String?,
      description: json['description'] as String?,
      headline: json['headline'] as String?,
      location: json['location'] as String?,
      host: json['host'] as String?,
      street: json['street'] as String?,
      start: json['start'] as num?,
      end: json['end'] as num?,
    )..url = json['URL'] as String?;

Map<String, dynamic> _$EventsListModelToJson(EventsListModel instance) =>
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
    };
