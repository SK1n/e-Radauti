// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furniture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FurnitureModel _$FurnitureModelFromJson(Map<String, dynamic> json) =>
    FurnitureModel(
      (json['context'] as List<dynamic>)
          .map((e) => ERContextModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FurnitureModelToJson(FurnitureModel instance) =>
    <String, dynamic>{
      'context': instance.context,
    };
