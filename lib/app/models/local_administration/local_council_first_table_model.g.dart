// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_council_first_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalCouncilFirstTableModel _$$_LocalCouncilFirstTableModelFromJson(
        Map<String, dynamic> json) =>
    _$_LocalCouncilFirstTableModel(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      party: json['party'] as String,
      wealth:
          (json['wealth'] as List<dynamic>).map((e) => e as String).toList(),
      interests:
          (json['interests'] as List<dynamic>).map((e) => e as String).toList(),
      fbUrl: json['fbUrl'] as String,
    );

Map<String, dynamic> _$$_LocalCouncilFirstTableModelToJson(
        _$_LocalCouncilFirstTableModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'party': instance.party,
      'wealth': instance.wealth,
      'interests': instance.interests,
      'fbUrl': instance.fbUrl,
    };
