// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      accessAnnouncements: json['access_announcements'] as bool? ?? false,
      accessEvents: json['access_events'] as bool? ?? false,
      accessLocalCouncil: json['access_local_council'] as bool? ?? false,
      accessNotifications: json['access_notifications'] as bool? ?? false,
      accessPortal: json['access_portal'] as bool? ?? false,
      admin: json['admin'] as bool? ?? false,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      verifiedEmail: json['verified_email'] as bool? ?? false,
      reports: (json['reports'] as List<dynamic>?)
              ?.map(
                  (e) => ReportProblemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => EventModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'access_announcements': instance.accessAnnouncements,
      'access_events': instance.accessEvents,
      'access_local_council': instance.accessLocalCouncil,
      'access_notifications': instance.accessNotifications,
      'access_portal': instance.accessPortal,
      'admin': instance.admin,
      'email': instance.email,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'verified_email': instance.verifiedEmail,
      'reports': instance.reports,
      'events': instance.events,
    };
