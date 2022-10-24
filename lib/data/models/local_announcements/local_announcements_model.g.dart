// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_announcements_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalAnnouncementsModel _$LocalAnnouncementsModelFromJson(
        Map<String, dynamic> json) =>
    LocalAnnouncementsModel(
      (json['announcement'] as List<dynamic>?)
          ?.map((e) =>
              LocalAnnouncementsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocalAnnouncementsModelToJson(
        LocalAnnouncementsModel instance) =>
    <String, dynamic>{
      'announcement': instance.items,
    };
