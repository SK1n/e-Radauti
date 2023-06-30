// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxiModel _$TaxiModelFromJson(Map<String, dynamic> json) => TaxiModel(
      (json['taxi'] as List<dynamic>)
          .map((e) => TaxiItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TaxiModelToJson(TaxiModel instance) => <String, dynamic>{
      'taxi': instance.taxis,
    };
