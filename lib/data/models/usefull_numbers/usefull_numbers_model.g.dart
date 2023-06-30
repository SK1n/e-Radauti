// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usefull_numbers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsefullNumbersModel _$UsefullNumbersModelFromJson(Map<String, dynamic> json) =>
    UsefullNumbersModel(
      (json['authorities'] as List<dynamic>?)
          ?.map((e) => TrainItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['public'] as List<dynamic>)
          .map((e) =>
              UsefullNumbersItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['upsets'] as List<dynamic>)
          .map((e) =>
              UsefullNumbersItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsefullNumbersModelToJson(
        UsefullNumbersModel instance) =>
    <String, dynamic>{
      'authorities': instance.localAuthorities,
      'public': instance.publicInstitutions,
      'upsets': instance.localUpsets,
    };
