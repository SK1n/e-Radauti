// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindModel _$WindModelFromJson(Map<String, dynamic> json) => WindModel(
      json['vant'] as String,
      json['presiunetext'] as String,
    );

Map<String, dynamic> _$WindModelToJson(WindModel instance) => <String, dynamic>{
      'vant': instance.wind,
      'presiunetext': instance.pression,
    };
