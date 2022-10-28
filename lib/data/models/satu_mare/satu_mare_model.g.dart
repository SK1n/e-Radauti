// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satu_mare_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SatuMareModel _$SatuMareModelFromJson(Map<String, dynamic> json) =>
    SatuMareModel(
      (json['air'] as List<dynamic>?)
          ?.map((e) => SatuMareItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SatuMareModelToJson(SatuMareModel instance) =>
    <String, dynamic>{
      'air': instance.item,
    };
