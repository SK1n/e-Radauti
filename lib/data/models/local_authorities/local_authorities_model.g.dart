// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_authorities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalAuthoritiesModel _$LocalAuthoritiesModelFromJson(
        Map<String, dynamic> json) =>
    LocalAuthoritiesModel(
      (json['authorities'] as List<dynamic>?)
          ?.map((e) =>
              LocalAuthoritiesItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocalAuthoritiesModelToJson(
        LocalAuthoritiesModel instance) =>
    <String, dynamic>{
      'authorities': instance.items,
    };
