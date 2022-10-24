// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satu_mare_wind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SatuMareWind _$SatuMareWindFromJson(Map<String, dynamic> json) => SatuMareWind(
      speed: (json['speed'] as num?)?.toDouble(),
      direction: json['direction'] as int?,
    );

Map<String, dynamic> _$SatuMareWindToJson(SatuMareWind instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'direction': instance.direction,
    };
