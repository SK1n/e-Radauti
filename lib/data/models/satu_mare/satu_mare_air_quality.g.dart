// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satu_mare_air_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SatuMareAirQuality _$SatuMareAirQualityFromJson(Map<String, dynamic> json) =>
    SatuMareAirQuality(
      current: json['current'] == null
          ? null
          : SatuMareCurrent.fromJson(json['current'] as Map<String, dynamic>),
      historical: json['historical'] == null
          ? null
          : SatuMareHistorical.fromJson(
              json['historical'] as Map<String, dynamic>),
      coordinates: json['coordinates'] == null
          ? null
          : SatuMareCoordinates.fromJson(
              json['coordinates'] as Map<String, dynamic>),
      name: json['name'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$SatuMareAirQualityToJson(SatuMareAirQuality instance) =>
    <String, dynamic>{
      'current': instance.current,
      'historical': instance.historical,
      'coordinates': instance.coordinates,
      'name': instance.name,
      'city': instance.city,
    };
