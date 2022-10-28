// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satu_mare_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SatuMareItemModel _$SatuMareItemModelFromJson(Map<String, dynamic> json) =>
    SatuMareItemModel(
      json['R'] as int?,
      json['G'] as int?,
      json['B'] as int?,
      json['A'] as int?,
      json['direction'] as String?,
      json['formatedDate'] as String?,
      json['quality'] as String?,
      json['ts'] as String?,
      json['directionDegrees'] as num?,
      json['hm'] as num?,
      json['pm25'] as num?,
      json['pression'] as num?,
      json['temp'] as num?,
      json['wind'] as num?,
    );

Map<String, dynamic> _$SatuMareItemModelToJson(SatuMareItemModel instance) =>
    <String, dynamic>{
      'R': instance.r,
      'G': instance.g,
      'B': instance.b,
      'A': instance.a,
      'direction': instance.direction,
      'formatedDate': instance.fDate,
      'quality': instance.quality,
      'ts': instance.ts,
      'directionDegrees': instance.directionDegrees,
      'hm': instance.hm,
      'pm25': instance.pm,
      'pression': instance.pression,
      'temp': instance.temp,
      'wind': instance.wind,
    };
