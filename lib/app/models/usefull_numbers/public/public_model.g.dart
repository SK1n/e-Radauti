// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'public_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PublicModel _$$_PublicModelFromJson(Map<String, dynamic> json) =>
    _$_PublicModel(
      items: (json['public'] as List<dynamic>?)
              ?.map((e) => PublicItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PublicModelToJson(_$_PublicModel instance) =>
    <String, dynamic>{
      'public': instance.items,
    };

_$_PublicItemModel _$$_PublicItemModelFromJson(Map<String, dynamic> json) =>
    _$_PublicItemModel(
      emails:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      phones:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$$_PublicItemModelToJson(_$_PublicItemModel instance) =>
    <String, dynamic>{
      'email': instance.emails,
      'phone': instance.phones,
      'title': instance.title,
    };
