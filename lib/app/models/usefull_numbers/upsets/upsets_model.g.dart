// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'upsets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpsetsModel _$$_UpsetsModelFromJson(Map<String, dynamic> json) =>
    _$_UpsetsModel(
      items: (json['upsets'] as List<dynamic>?)
              ?.map((e) => UpsetsItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_UpsetsModelToJson(_$_UpsetsModel instance) =>
    <String, dynamic>{
      'upsets': instance.items,
    };

_$_UpsetsItemModel _$$_UpsetsItemModelFromJson(Map<String, dynamic> json) =>
    _$_UpsetsItemModel(
      emails:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      phones:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$$_UpsetsItemModelToJson(_$_UpsetsItemModel instance) =>
    <String, dynamic>{
      'email': instance.emails,
      'phone': instance.phones,
      'title': instance.title,
    };
