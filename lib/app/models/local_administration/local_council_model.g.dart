// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_council_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalCouncilModel _$$_LocalCouncilModelFromJson(Map<String, dynamic> json) =>
    _$_LocalCouncilModel(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      party: json['party'] as String,
      wealth:
          (json['wealth'] as List<dynamic>).map((e) => e as String).toList(),
      interests:
          (json['interests'] as List<dynamic>).map((e) => e as String).toList(),
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      fbUrl: json['fbUrl'] as String,
    );

Map<String, dynamic> _$$_LocalCouncilModelToJson(
        _$_LocalCouncilModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'party': instance.party,
      'wealth': instance.wealth,
      'interests': instance.interests,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'fbUrl': instance.fbUrl,
    };
