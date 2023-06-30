// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkersModel _$MarkersModelFromJson(Map<String, dynamic> json) => MarkersModel(
      category: json['category'] as String,
      description: json['description'] as String,
      email: json['email'] as String,
      index: json['index'] as int,
      institution: json['institution'] as String,
      institutionEmail: json['institution_email'] as String,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      status: json['status'] as String,
      subject: json['subject'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      url: (json['url'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MarkersModelToJson(MarkersModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'email': instance.email,
      'index': instance.index,
      'institution': instance.institution,
      'institution_email': instance.institutionEmail,
      'lat': instance.lat,
      'long': instance.long,
      'name': instance.name,
      'phone': instance.phone,
      'status': instance.status,
      'subject': instance.subject,
      'url': instance.url,
      'created_at': instance.createdAt?.toIso8601String(),
    };
