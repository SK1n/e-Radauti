// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_problem_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportProblemItemModel _$$_ReportProblemItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_ReportProblemItemModel(
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
      createdAt: json['created_at'] as String?,
      url: (json['url'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ReportProblemItemModelToJson(
        _$_ReportProblemItemModel instance) =>
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
      'created_at': instance.createdAt,
      'url': instance.url,
    };
