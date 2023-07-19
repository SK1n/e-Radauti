// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_council_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalCouncilModel _$$_LocalCouncilModelFromJson(Map<String, dynamic> json) =>
    _$_LocalCouncilModel(
      items: (json['localcouncil'] as List<dynamic>?)
              ?.map((e) =>
                  LocalCouncilItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_LocalCouncilModelToJson(
        _$_LocalCouncilModel instance) =>
    <String, dynamic>{
      'localcouncil': instance.items,
    };

_$_LocalCouncilItemModel _$$_LocalCouncilItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_LocalCouncilItemModel(
      firstname: json['name'] as String? ?? '',
      surname: json['surname'] as String? ?? '',
      imageUrl: json['url'] as String? ?? '',
      party: json['party'] as String? ?? '',
      email: json['email'] as String? ?? '',
      tel: json['phone_number'] as String? ?? '',
      function: json['function'] as String? ?? '',
    );

Map<String, dynamic> _$$_LocalCouncilItemModelToJson(
        _$_LocalCouncilItemModel instance) =>
    <String, dynamic>{
      'name': instance.firstname,
      'surname': instance.surname,
      'url': instance.imageUrl,
      'party': instance.party,
      'email': instance.email,
      'phone_number': instance.tel,
      'function': instance.function,
    };
