// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_council_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalCouncilModel _$LocalCouncilModelFromJson(Map<String, dynamic> json) =>
    LocalCouncilModel(
      (json['localcouncil'] as List<dynamic>)
          .map((e) => LocalCouncilItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocalCouncilModelToJson(LocalCouncilModel instance) =>
    <String, dynamic>{
      'localcouncil': instance.items,
    };
