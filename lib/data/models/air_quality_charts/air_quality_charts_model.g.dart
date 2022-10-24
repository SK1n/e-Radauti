// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_charts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityChartsModel _$AirQualityChartsModelFromJson(
        Map<String, dynamic> json) =>
    AirQualityChartsModel(
      (json['air'] as List<dynamic>?)
          ?.map((e) =>
              AirQualityChartsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AirQualityChartsModelToJson(
        AirQualityChartsModel instance) =>
    <String, dynamic>{
      'air': instance.items,
    };
