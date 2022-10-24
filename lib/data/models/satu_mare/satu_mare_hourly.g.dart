// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satu_mare_hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SatuMareHourly _$SatuMareHourlyFromJson(Map<String, dynamic> json) =>
    SatuMareHourly(
      ts: json['ts'] as String?,
      aqius: json['aqius'] as int?,
      aqicn: json['aqicn'] as int?,
      pm25: json['pm25'] == null
          ? null
          : SatuMarePm25.fromJson(json['pm25'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SatuMareHourlyToJson(SatuMareHourly instance) =>
    <String, dynamic>{
      'ts': instance.ts,
      'aqius': instance.aqius,
      'aqicn': instance.aqicn,
      'pm25': instance.pm25,
    };
