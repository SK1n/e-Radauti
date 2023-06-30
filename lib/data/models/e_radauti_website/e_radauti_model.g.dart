// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_radauti_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ERadautiModel _$ERadautiModelFromJson(Map<String, dynamic> json) =>
    ERadautiModel(
      json['context'] == null
          ? null
          : ERContextModel.fromJson(json['context'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ERadautiModelToJson(ERadautiModel instance) =>
    <String, dynamic>{
      'context': instance.context,
    };
