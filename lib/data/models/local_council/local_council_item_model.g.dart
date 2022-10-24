// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_council_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalCouncilItemModel _$LocalCouncilItemModelFromJson(
        Map<String, dynamic> json) =>
    LocalCouncilItemModel(
      json['email'] as String?,
      json['function'] as String?,
      json['name'] as String?,
      json['party'] as String?,
      json['phone_number'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$LocalCouncilItemModelToJson(
        LocalCouncilItemModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'function': instance.function,
      'name': instance.name,
      'party': instance.party,
      'phone_number': instance.phoneNumber,
      'url': instance.url,
    };
