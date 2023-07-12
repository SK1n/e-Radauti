// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'new_events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewEventsModel _$$_NewEventsModelFromJson(Map<String, dynamic> json) =>
    _$_NewEventsModel(
      (json['events'] as List<dynamic>?)
              ?.map((e) => EventsItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_NewEventsModelToJson(_$_NewEventsModel instance) =>
    <String, dynamic>{
      'events': instance.list,
    };
