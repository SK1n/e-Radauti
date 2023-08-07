import 'package:flutterapperadauti/app/models/events/event_model.dart';
import 'package:flutterapperadauti/app/models/report_problem/report_problem_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'access_announcements', defaultValue: false)
    required bool accessAnnouncements,
    @JsonKey(name: 'access_events', defaultValue: false)
    required bool accessEvents,
    @JsonKey(name: 'access_local_council', defaultValue: false)
    required bool accessLocalCouncil,
    @JsonKey(name: 'access_notifications', defaultValue: false)
    required bool accessNotifications,
    @JsonKey(name: 'access_portal', defaultValue: false)
    required bool accessPortal,
    @JsonKey(name: 'admin', defaultValue: false) required bool admin,
    @JsonKey(name: 'email', defaultValue: '') required String email,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'phone_number', defaultValue: '')
    required String phoneNumber,
    @JsonKey(name: 'verified_email', defaultValue: false)
    required bool verifiedEmail,
    @JsonKey(name: 'reports', defaultValue: [])
    required List<ReportProblemModel> reports,
    @JsonKey(name: 'events', defaultValue: []) required List<EventModel> events,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
