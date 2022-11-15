// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_meetings_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalMeetingsItemModel _$LocalMeetingsItemModelFromJson(
        Map<String, dynamic> json) =>
    LocalMeetingsItemModel(
      json['URL'] as String?,
      json['theagend'] as String?,
      json['date'] as String?,
    );

Map<String, dynamic> _$LocalMeetingsItemModelToJson(
        LocalMeetingsItemModel instance) =>
    <String, dynamic>{
      'URL': instance.fbLink,
      'theagend': instance.pdfLink,
      'date': instance.date,
    };
