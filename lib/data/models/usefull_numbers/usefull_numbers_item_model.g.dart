// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usefull_numbers_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsefullNumbersItemModel _$UsefullNumbersItemModelFromJson(
        Map<String, dynamic> json) =>
    UsefullNumbersItemModel(
      json['email'] as String?,
      (json['phone'] as List<dynamic>).map((e) => e as String).toList(),
      json['title'] as String,
    );

Map<String, dynamic> _$UsefullNumbersItemModelToJson(
        UsefullNumbersItemModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phoneNumbers,
      'title': instance.title,
    };
