// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satu_mare_current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SatuMareCurrent _$SatuMareCurrentFromJson(Map<String, dynamic> json) =>
    SatuMareCurrent(
      ts: json['ts'] as String?,
      aqius: json['aqius'] as int?,
      aqicn: json['aqicn'] as int?,
      pm25: json['pm25'] == null
          ? null
          : SatuMarePm25.fromJson(json['pm25'] as Map<String, dynamic>),
      mainus: json['mainus'] as String?,
      maincn: json['maincn'] as String?,
      condition: json['condition'] as String?,
      icon: json['icon'] as String?,
      humidity: json['humidity'] as int?,
      pressure: json['pressure'] as int?,
      temperature: json['temperature'] as int?,
      wind: json['wind'] == null
          ? null
          : SatuMareWind.fromJson(json['wind'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SatuMareCurrentToJson(SatuMareCurrent instance) =>
    <String, dynamic>{
      'ts': instance.ts,
      'aqius': instance.aqius,
      'aqicn': instance.aqicn,
      'pm25': instance.pm25,
      'mainus': instance.mainus,
      'maincn': instance.maincn,
      'condition': instance.condition,
      'icon': instance.icon,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'temperature': instance.temperature,
      'wind': instance.wind,
    };
