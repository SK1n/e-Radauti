// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_institutions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicInstitutionsModel _$PublicInstitutionsModelFromJson(
        Map<String, dynamic> json) =>
    PublicInstitutionsModel(
      (json['public'] as List<dynamic>?)
          ?.map((e) =>
              PublicInstitutionsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PublicInstitutionsModelToJson(
        PublicInstitutionsModel instance) =>
    <String, dynamic>{
      'public': instance.items,
    };
