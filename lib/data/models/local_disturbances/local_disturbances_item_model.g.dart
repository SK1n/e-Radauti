// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_disturbances_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalDisturbancesItemModel _$LocalDisturbancesItemModelFromJson(
        Map<String, dynamic> json) =>
    LocalDisturbancesItemModel(
      (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['title'] as String?,
    );

Map<String, dynamic> _$LocalDisturbancesItemModelToJson(
        LocalDisturbancesItemModel instance) =>
    <String, dynamic>{
      'email': instance.emails,
      'phone': instance.phoneNumbers,
      'title': instance.title,
    };
