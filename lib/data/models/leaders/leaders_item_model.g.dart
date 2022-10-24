// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaders_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadersItemModel _$LeadersItemModelFromJson(Map<String, dynamic> json) =>
    LeadersItemModel(
      email: json['email'] as String?,
      function: json['function'] as String?,
      interests: json['interests'] as String?,
      location: json['location'] as String?,
      name: json['name'] as String?,
      urlFb: json['url_fb'] as String?,
      urlImg: json['url_img'] as String?,
      wealth: json['wealth'] as String?,
    );

Map<String, dynamic> _$LeadersItemModelToJson(LeadersItemModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'function': instance.function,
      'interests': instance.interests,
      'location': instance.location,
      'name': instance.name,
      'url_fb': instance.urlFb,
      'url_img': instance.urlImg,
      'wealth': instance.wealth,
    };
