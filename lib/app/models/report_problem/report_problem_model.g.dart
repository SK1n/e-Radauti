// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_problem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportProblemModel _$$_ReportProblemModelFromJson(
        Map<String, dynamic> json) =>
    _$_ReportProblemModel(
      category: json['category'] as String? ?? '',
      description: json['description'] as String? ?? '',
      email: json['email'] as String? ?? '',
      index: json['index'] as int? ?? 7,
      institution: json['institution'] as String? ?? '',
      institutionEmail: json['institution_email'] as String? ?? '',
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      name: json['username'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      status: json['status'] as String? ?? '',
      subject: json['subject'] as String? ?? '',
      createdAt: json['created_at'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      emailSent: json['email_sent'] as bool? ?? false,
      shouldShowOnMap: json['shouldShowOnMap'] as bool? ?? false,
      userUid: json['userUID'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReportProblemModelToJson(
        _$_ReportProblemModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'description': instance.description,
      'email': instance.email,
      'index': instance.index,
      'institution': instance.institution,
      'institution_email': instance.institutionEmail,
      'lat': instance.lat,
      'long': instance.long,
      'username': instance.name,
      'phone': instance.phone,
      'status': instance.status,
      'subject': instance.subject,
      'created_at': instance.createdAt,
      'images': instance.images,
      'email_sent': instance.emailSent,
      'shouldShowOnMap': instance.shouldShowOnMap,
      'userUID': instance.userUid,
    };
