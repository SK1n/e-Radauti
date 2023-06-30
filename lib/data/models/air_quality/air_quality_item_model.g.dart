// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityItemModel _$AirQualityItemModelFromJson(Map<String, dynamic> json) =>
    AirQualityItemModel(
      json['center_co'] as num,
      json['center_hm'] as num,
      json['center_pm'] as num,
      AirQualityColorModel.fromJson(
          json['center_pm_color'] as Map<String, dynamic>),
      json['center_quality'] as String,
      json['center_quality_image'] as num,
      json['center_temp'] as num,
      json['date_time'] as String,
      json['dornesti_hm'] as num,
      json['dornesti_pm'] as num,
      json['dornesti_pression'] as num,
      json['dornesti_quality'] as String,
      json['dornesti_quality_image'] as num,
      json['dornesti_temp'] as num,
      json['dornesti_wind_direction'] as num,
      json['dornesti_wind_speed'] as num,
      json['ro_meteo_hm'] as num,
      json['ro_meteo_pression'] as num,
      json['ro_meteo_snow'] as String,
      json['ro_meteo_temp'] as num,
      json['ro_meteo_wind_direction'] as String,
      json['ro_meteo_wind_speed'] as num,
      AirQualityColorModel.fromJson(
          json['dornesti_pm_color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirQualityItemModelToJson(
        AirQualityItemModel instance) =>
    <String, dynamic>{
      'center_co': instance.centerCo,
      'center_hm': instance.centerHm,
      'center_pm': instance.centerPm,
      'center_pm_color': instance.centerColor,
      'center_quality': instance.centerQuality,
      'center_quality_image': instance.centerImage,
      'center_temp': instance.centerTemp,
      'date_time': instance.dateTime,
      'dornesti_hm': instance.dornestiHm,
      'dornesti_pm': instance.dornestiPm,
      'dornesti_pm_color': instance.dornestiColor,
      'dornesti_pression': instance.dornestiPression,
      'dornesti_quality': instance.dornestiQuality,
      'dornesti_quality_image': instance.dornestiImage,
      'dornesti_temp': instance.dornestiTemp,
      'dornesti_wind_direction': instance.dornestiWindDirection,
      'dornesti_wind_speed': instance.dornestiWindSpeed,
      'ro_meteo_hm': instance.roMeteoHm,
      'ro_meteo_pression': instance.roMeteoPression,
      'ro_meteo_snow': instance.roMeteoSnow,
      'ro_meteo_temp': instance.roMeteoTemp,
      'ro_meteo_wind_direction': instance.roMeteoWindDirection,
      'ro_meteo_wind_speed': instance.roMeteoWindSpeed,
    };
