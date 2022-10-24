// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_institutions_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicInstitutionsItemModel _$PublicInstitutionsItemModelFromJson(
        Map<String, dynamic> json) =>
    PublicInstitutionsItemModel(
      (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['phone'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['title'] as String?,
    );

Map<String, dynamic> _$PublicInstitutionsItemModelToJson(
        PublicInstitutionsItemModel instance) =>
    <String, dynamic>{
      'email': instance.emails,
      'phone': instance.phoneNumbers,
      'title': instance.title,
    };
