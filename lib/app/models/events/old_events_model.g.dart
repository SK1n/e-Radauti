// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old_events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OldEventsModel _$$_OldEventsModelFromJson(Map<String, dynamic> json) =>
    _$_OldEventsModel(
      (json['oldEvents'] as List<dynamic>)
          .map((e) => EventsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OldEventsModelToJson(_$_OldEventsModel instance) =>
    <String, dynamic>{
      'oldEvents': instance.list,
    };
