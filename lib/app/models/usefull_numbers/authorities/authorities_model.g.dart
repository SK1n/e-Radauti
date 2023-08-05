// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'authorities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthoritiesModel _$$_AuthoritiesModelFromJson(Map<String, dynamic> json) =>
    _$_AuthoritiesModel(
      items: (json['authorities'] as List<dynamic>?)
              ?.map((e) =>
                  AuthoritiesItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_AuthoritiesModelToJson(_$_AuthoritiesModel instance) =>
    <String, dynamic>{
      'authorities': instance.items,
    };

_$_AuthoritiesItemModel _$$_AuthoritiesItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_AuthoritiesItemModel(
      emails:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      phones:
          (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$$_AuthoritiesItemModelToJson(
        _$_AuthoritiesItemModel instance) =>
    <String, dynamic>{
      'email': instance.emails,
      'phone': instance.phones,
      'title': instance.title,
    };
