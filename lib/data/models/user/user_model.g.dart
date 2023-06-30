// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['email'] as String?,
      json['name'] as String?,
      json['phone_number'] as String?,
      json['verified_email'] as bool?,
      json['access_portal'] as bool? ?? false,
      json['access_local_council'] as bool? ?? false,
      json['access_events'] as bool? ?? false,
      json['access_notifications'] as bool? ?? false,
      json['access_announcements'] as bool? ?? false,
      json['admin'] as bool? ?? false,
      (json['reports'] as List<dynamic>?)
              ?.map((e) => MarkersModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'verified_email': instance.verified,
      'access_portal': instance.accessPortal,
      'access_local_council': instance.accessLocalCouncil,
      'access_events': instance.accessEvents,
      'access_notifications': instance.accessNotifications,
      'access_announcements': instance.accessAnnouncements,
      'admin': instance.admin,
      'reports': instance.reports,
    };
