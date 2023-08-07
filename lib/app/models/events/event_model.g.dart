// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventModel _$$_EventModelFromJson(Map<String, dynamic> json) =>
    _$_EventModel(
      category: (json['category'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      description: json['description'] as String? ?? '',
      host: json['host'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      location: json['location'] as String? ?? '',
      title: json['title'] as String? ?? '',
      startTimestamp: json['startTimestamp'] as int? ?? 0,
      endTimestamp: json['endTimestamp'] as int? ?? 0,
    );

Map<String, dynamic> _$$_EventModelToJson(_$_EventModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'host': instance.host,
      'imageUrl': instance.imageUrl,
      'location': instance.location,
      'title': instance.title,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
    };
