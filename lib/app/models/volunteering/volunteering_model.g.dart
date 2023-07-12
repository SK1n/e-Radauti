// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'volunteering_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VolunteeringModel _$$_VolunteeringModelFromJson(Map<String, dynamic> json) =>
    _$_VolunteeringModel(
      items: (json['volunteering'] as List<dynamic>?)
              ?.map((e) =>
                  VolunteeringItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_VolunteeringModelToJson(
        _$_VolunteeringModel instance) =>
    <String, dynamic>{
      'volunteering': instance.items,
    };

_$_VolunteeringItemModel _$$_VolunteeringItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_VolunteeringItemModel(
      email: json['email'] as String? ?? '',
      image: json['image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      website: json['website'] as String? ?? '',
    );

Map<String, dynamic> _$$_VolunteeringItemModelToJson(
        _$_VolunteeringItemModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'image': instance.image,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'website': instance.website,
    };
