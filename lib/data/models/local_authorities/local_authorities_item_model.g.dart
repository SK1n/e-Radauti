// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_authorities_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalAuthoritiesItemModel _$LocalAuthoritiesItemModelFromJson(
        Map<String, dynamic> json) =>
    LocalAuthoritiesItemModel(
      (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['title'] as String?,
    );

Map<String, dynamic> _$LocalAuthoritiesItemModelToJson(
        LocalAuthoritiesItemModel instance) =>
    <String, dynamic>{
      'email': instance.emails,
      'phone': instance.phoneNumbers,
      'title': instance.title,
    };
