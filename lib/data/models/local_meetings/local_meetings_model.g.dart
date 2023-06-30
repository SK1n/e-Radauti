// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_meetings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalMeetingsModel _$LocalMeetingsModelFromJson(Map<String, dynamic> json) =>
    LocalMeetingsModel(
      (json['meetings'] as List<dynamic>)
          .map(
              (e) => LocalMeetingsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocalMeetingsModelToJson(LocalMeetingsModel instance) =>
    <String, dynamic>{
      'meetings': instance.items,
    };
