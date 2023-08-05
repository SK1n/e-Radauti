// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'local_announcements_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalAnnouncementsModel _$$_LocalAnnouncementsModelFromJson(
        Map<String, dynamic> json) =>
    _$_LocalAnnouncementsModel(
      items: (json['announcements'] as List<dynamic>?)
              ?.map((e) => LocalAnnouncementsItemModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_LocalAnnouncementsModelToJson(
        _$_LocalAnnouncementsModel instance) =>
    <String, dynamic>{
      'announcements': instance.items,
    };

_$_LocalAnnouncementsItemModel _$$_LocalAnnouncementsItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_LocalAnnouncementsItemModel(
      title: json['title'] as String? ?? '',
      image: json['url'] as String? ?? '',
      description: json['description'] as String? ?? '',
      dateCreated: json['date_created'] as int? ?? 0,
    );

Map<String, dynamic> _$$_LocalAnnouncementsItemModelToJson(
        _$_LocalAnnouncementsItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.image,
      'description': instance.description,
      'date_created': instance.dateCreated,
    };
