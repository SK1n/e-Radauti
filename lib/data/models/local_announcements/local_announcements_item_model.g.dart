// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_announcements_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalAnnouncementsItemModel _$LocalAnnouncementsItemModelFromJson(
        Map<String, dynamic> json) =>
    LocalAnnouncementsItemModel(
      json['URL'] as String?,
      json['date'] as String?,
      json['description'] as String?,
      json['host'] as String?,
      json['title'] as String?,
    );

Map<String, dynamic> _$LocalAnnouncementsItemModelToJson(
        LocalAnnouncementsItemModel instance) =>
    <String, dynamic>{
      'URL': instance.url,
      'date': instance.date,
      'description': instance.description,
      'host': instance.host,
      'title': instance.title,
    };
