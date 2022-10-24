// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_legislation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalLegislationModel _$LocalLegislationModelFromJson(
        Map<String, dynamic> json) =>
    LocalLegislationModel(
      items: (json['2020'] as List<dynamic>?)
          ?.map((e) =>
              LocalLegislationItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocalLegislationModelToJson(
        LocalLegislationModel instance) =>
    <String, dynamic>{
      '2020': instance.items,
    };
