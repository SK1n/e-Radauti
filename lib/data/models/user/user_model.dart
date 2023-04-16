import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'verified_email')
  final bool? verified;
  @JsonKey(name: 'access_portal', defaultValue: false)
  final bool accessPortal;
  @JsonKey(name: 'access_local_council', defaultValue: false)
  final bool accessLocalCouncil;
  @JsonKey(name: 'access_events', defaultValue: false)
  final bool accessEvents;
  @JsonKey(name: 'access_notifications', defaultValue: false)
  final bool accessNotifications;
  @JsonKey(name: 'access_announcements', defaultValue: false)
  final bool accessAnnouncements;
  @JsonKey(name: "admin", defaultValue: false)
  final bool admin;

  const UserModel(
    this.email,
    this.name,
    this.phoneNumber,
    this.verified,
    this.accessPortal,
    this.accessLocalCouncil,
    this.accessEvents,
    this.accessNotifications,
    this.accessAnnouncements,
    this.admin,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
