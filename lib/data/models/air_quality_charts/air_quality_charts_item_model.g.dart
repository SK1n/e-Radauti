// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_charts_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityChartsItemModel _$AirQualityChartsItemModelFromJson(
        Map<String, dynamic> json) =>
    AirQualityChartsItemModel(
      json['date'] as String?,
      json['direction'] as String?,
      json['formated_date'] as String? ?? '24/10/2022 2:32',
      json['co2'] as num?,
      json['humidity'] as num?,
      json['humidity_center'] as num?,
      json['pm25'] as num?,
      json['pression'] as num?,
      json['temp_center'] as num?,
      json['temp_meteo'] as num?,
      json['wind'] as num?,
    );

Map<String, dynamic> _$AirQualityChartsItemModelToJson(
        AirQualityChartsItemModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'direction': instance.direction,
      'formated_date': instance.formatedDate,
      'co2': instance.co,
      'humidity': instance.humidity,
      'humidity_center': instance.humidityC,
      'pm25': instance.pm,
      'pression': instance.pression,
      'temp_center': instance.tempC,
      'temp_meteo': instance.tempM,
      'wind': instance.wind,
    };
