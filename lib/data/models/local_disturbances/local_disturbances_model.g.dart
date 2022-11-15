// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_disturbances_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalDisturbancesModel _$LocalDisturbancesModelFromJson(
        Map<String, dynamic> json) =>
    LocalDisturbancesModel(
      (json['upsets'] as List<dynamic>?)
          ?.map((e) =>
              LocalDisturbancesItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocalDisturbancesModelToJson(
        LocalDisturbancesModel instance) =>
    <String, dynamic>{
      'upsets': instance.items,
    };
