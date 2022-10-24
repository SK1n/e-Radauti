// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_legislation_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalLegislationItemModel _$LocalLegislationItemModelFromJson(
        Map<String, dynamic> json) =>
    LocalLegislationItemModel(
      json['an'] as int?,
      json['link'] as String?,
      json['titlu'] as String?,
    );

Map<String, dynamic> _$LocalLegislationItemModelToJson(
        LocalLegislationItemModel instance) =>
    <String, dynamic>{
      'an': instance.year,
      'link': instance.link,
      'titlu': instance.title,
    };
