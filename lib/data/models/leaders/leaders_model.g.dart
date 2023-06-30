// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadersModel _$LeadersModelFromJson(Map<String, dynamic> json) => LeadersModel(
      (json['leaders'] as List<dynamic>)
          .map((e) => LeadersItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeadersModelToJson(LeadersModel instance) =>
    <String, dynamic>{
      'leaders': instance.items,
    };
