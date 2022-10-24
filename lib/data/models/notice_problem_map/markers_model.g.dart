// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkersModel _$MarkersModelFromJson(Map<String, dynamic> json) => MarkersModel(
      category: json['category'] as String?,
      description: json['description'] as String?,
      email: json['email'] as String?,
      index: json['index'] as num?,
      institution: json['institution'] as String?,
      institutionEmail: json['institutionEmail'] as String?,
      lat: json['lat'] as num?,
      long: json['long'] as num?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      status: json['status'] as String?,
      subject: json['subject'] as String?,
    )..url = (json['url'] as List<dynamic>?)?.map((e) => e as String).toList();

Map<String, dynamic> _$MarkersModelToJson(MarkersModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'email': instance.email,
      'index': instance.index,
      'institution': instance.institution,
      'institutionEmail': instance.institutionEmail,
      'lat': instance.lat,
      'long': instance.long,
      'name': instance.name,
      'phone': instance.phone,
      'status': instance.status,
      'subject': instance.subject,
      'url': instance.url,
    };
