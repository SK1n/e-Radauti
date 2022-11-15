// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
      json['path'] as String?,
      json['url'] as String?,
      json['isExact'] as bool?,
      json['params'] == null
          ? null
          : ParamsModel.fromJson(json['params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'path': instance.path,
      'url': instance.url,
      'isExact': instance.isExact,
      'params': instance.params,
    };
