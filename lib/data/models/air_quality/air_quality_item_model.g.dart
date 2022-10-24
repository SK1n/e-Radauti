// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityItemModel _$AirQualityItemModelFromJson(Map<String, dynamic> json) =>
    AirQualityItemModel(
      json['R'] as int?,
      json['G'] as int?,
      json['B'] as int?,
      json['A'] as int?,
      json['co2'] as num?,
      json['pm25'] as num?,
      json['tp'] as num?,
      json['wind'] as String?,
      json['pression'] as String?,
      json['airTS'] as String?,
      json['windMs'] as String?,
      json['direction'] as String?,
      json['formatedPression'] as String?,
      json['formatedDate'] as String?,
      json['quality'] as String?,
      json['hm'] as num?,
    );

Map<String, dynamic> _$AirQualityItemModelToJson(
        AirQualityItemModel instance) =>
    <String, dynamic>{
      'R': instance.r,
      'G': instance.g,
      'B': instance.b,
      'A': instance.a,
      'co2': instance.co,
      'pm25': instance.pm,
      'tp': instance.tp,
      'wind': instance.wind,
      'pression': instance.pression,
      'airTS': instance.airTs,
      'windMs': instance.windMs,
      'direction': instance.direction,
      'formatedPression': instance.fPression,
      'formatedDate': instance.fDate,
      'quality': instance.quality,
      'hm': instance.hm,
    };
