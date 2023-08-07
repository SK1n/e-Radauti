// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_council_leaders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalCouncilLeadersModel _$$_LocalCouncilLeadersModelFromJson(
        Map<String, dynamic> json) =>
    _$_LocalCouncilLeadersModel(
      items: (json['leaders'] as List<dynamic>?)
              ?.map((e) => LocalCouncilLeadersItemModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_LocalCouncilLeadersModelToJson(
        _$_LocalCouncilLeadersModel instance) =>
    <String, dynamic>{
      'leaders': instance.items,
    };

_$_LocalCouncilLeadersItemModel _$$_LocalCouncilLeadersItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_LocalCouncilLeadersItemModel(
      firstName: json['first_name'] as String? ?? '',
      surname: json['surname'] as String? ?? '',
      imageUrl: json['url_img'] as String? ?? '',
      fbUrl: json['url_fb'] as String? ?? '',
      email: json['email'] as String? ?? '',
      function: json['function'] as String? ?? '',
      interests: json['interests'] as String? ?? '',
      wealth: json['wealth'] as String? ?? '',
      location: json['location'] as String? ?? '',
    );

Map<String, dynamic> _$$_LocalCouncilLeadersItemModelToJson(
        _$_LocalCouncilLeadersItemModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'surname': instance.surname,
      'url_img': instance.imageUrl,
      'url_fb': instance.fbUrl,
      'email': instance.email,
      'function': instance.function,
      'interests': instance.interests,
      'wealth': instance.wealth,
      'location': instance.location,
    };
