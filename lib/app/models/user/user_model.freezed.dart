// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: 'access_announcements', defaultValue: false)
  bool get accessAnnouncements => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_events', defaultValue: false)
  bool get accessEvents => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_local_council', defaultValue: false)
  bool get accessLocalCouncil => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_notifications', defaultValue: false)
  bool get accessNotifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_portal', defaultValue: false)
  bool get accessPortal => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin', defaultValue: false)
  bool get admin => throw _privateConstructorUsedError;
  @JsonKey(name: 'email', defaultValue: '')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number', defaultValue: '')
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_email', defaultValue: false)
  bool get verifiedEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'reports', defaultValue: [])
  List<ReportProblemModel> get reports => throw _privateConstructorUsedError;
  @JsonKey(name: 'events', defaultValue: [])
  List<EventModel> get events => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_announcements', defaultValue: false)
          bool accessAnnouncements,
      @JsonKey(name: 'access_events', defaultValue: false)
          bool accessEvents,
      @JsonKey(name: 'access_local_council', defaultValue: false)
          bool accessLocalCouncil,
      @JsonKey(name: 'access_notifications', defaultValue: false)
          bool accessNotifications,
      @JsonKey(name: 'access_portal', defaultValue: false)
          bool accessPortal,
      @JsonKey(name: 'admin', defaultValue: false)
          bool admin,
      @JsonKey(name: 'email', defaultValue: '')
          String email,
      @JsonKey(name: 'name', defaultValue: '')
          String name,
      @JsonKey(name: 'phone_number', defaultValue: '')
          String phoneNumber,
      @JsonKey(name: 'verified_email', defaultValue: false)
          bool verifiedEmail,
      @JsonKey(name: 'reports', defaultValue: [])
          List<ReportProblemModel> reports,
      @JsonKey(name: 'events', defaultValue: [])
          List<EventModel> events});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessAnnouncements = null,
    Object? accessEvents = null,
    Object? accessLocalCouncil = null,
    Object? accessNotifications = null,
    Object? accessPortal = null,
    Object? admin = null,
    Object? email = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? verifiedEmail = null,
    Object? reports = null,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      accessAnnouncements: null == accessAnnouncements
          ? _value.accessAnnouncements
          : accessAnnouncements // ignore: cast_nullable_to_non_nullable
              as bool,
      accessEvents: null == accessEvents
          ? _value.accessEvents
          : accessEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      accessLocalCouncil: null == accessLocalCouncil
          ? _value.accessLocalCouncil
          : accessLocalCouncil // ignore: cast_nullable_to_non_nullable
              as bool,
      accessNotifications: null == accessNotifications
          ? _value.accessNotifications
          : accessNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      accessPortal: null == accessPortal
          ? _value.accessPortal
          : accessPortal // ignore: cast_nullable_to_non_nullable
              as bool,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedEmail: null == verifiedEmail
          ? _value.verifiedEmail
          : verifiedEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      reports: null == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportProblemModel>,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_announcements', defaultValue: false)
          bool accessAnnouncements,
      @JsonKey(name: 'access_events', defaultValue: false)
          bool accessEvents,
      @JsonKey(name: 'access_local_council', defaultValue: false)
          bool accessLocalCouncil,
      @JsonKey(name: 'access_notifications', defaultValue: false)
          bool accessNotifications,
      @JsonKey(name: 'access_portal', defaultValue: false)
          bool accessPortal,
      @JsonKey(name: 'admin', defaultValue: false)
          bool admin,
      @JsonKey(name: 'email', defaultValue: '')
          String email,
      @JsonKey(name: 'name', defaultValue: '')
          String name,
      @JsonKey(name: 'phone_number', defaultValue: '')
          String phoneNumber,
      @JsonKey(name: 'verified_email', defaultValue: false)
          bool verifiedEmail,
      @JsonKey(name: 'reports', defaultValue: [])
          List<ReportProblemModel> reports,
      @JsonKey(name: 'events', defaultValue: [])
          List<EventModel> events});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessAnnouncements = null,
    Object? accessEvents = null,
    Object? accessLocalCouncil = null,
    Object? accessNotifications = null,
    Object? accessPortal = null,
    Object? admin = null,
    Object? email = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? verifiedEmail = null,
    Object? reports = null,
    Object? events = null,
  }) {
    return _then(_$_UserModel(
      accessAnnouncements: null == accessAnnouncements
          ? _value.accessAnnouncements
          : accessAnnouncements // ignore: cast_nullable_to_non_nullable
              as bool,
      accessEvents: null == accessEvents
          ? _value.accessEvents
          : accessEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      accessLocalCouncil: null == accessLocalCouncil
          ? _value.accessLocalCouncil
          : accessLocalCouncil // ignore: cast_nullable_to_non_nullable
              as bool,
      accessNotifications: null == accessNotifications
          ? _value.accessNotifications
          : accessNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      accessPortal: null == accessPortal
          ? _value.accessPortal
          : accessPortal // ignore: cast_nullable_to_non_nullable
              as bool,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedEmail: null == verifiedEmail
          ? _value.verifiedEmail
          : verifiedEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      reports: null == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportProblemModel>,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {@JsonKey(name: 'access_announcements', defaultValue: false)
          required this.accessAnnouncements,
      @JsonKey(name: 'access_events', defaultValue: false)
          required this.accessEvents,
      @JsonKey(name: 'access_local_council', defaultValue: false)
          required this.accessLocalCouncil,
      @JsonKey(name: 'access_notifications', defaultValue: false)
          required this.accessNotifications,
      @JsonKey(name: 'access_portal', defaultValue: false)
          required this.accessPortal,
      @JsonKey(name: 'admin', defaultValue: false)
          required this.admin,
      @JsonKey(name: 'email', defaultValue: '')
          required this.email,
      @JsonKey(name: 'name', defaultValue: '')
          required this.name,
      @JsonKey(name: 'phone_number', defaultValue: '')
          required this.phoneNumber,
      @JsonKey(name: 'verified_email', defaultValue: false)
          required this.verifiedEmail,
      @JsonKey(name: 'reports', defaultValue: [])
          required final List<ReportProblemModel> reports,
      @JsonKey(name: 'events', defaultValue: [])
          required final List<EventModel> events})
      : _reports = reports,
        _events = events;

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey(name: 'access_announcements', defaultValue: false)
  final bool accessAnnouncements;
  @override
  @JsonKey(name: 'access_events', defaultValue: false)
  final bool accessEvents;
  @override
  @JsonKey(name: 'access_local_council', defaultValue: false)
  final bool accessLocalCouncil;
  @override
  @JsonKey(name: 'access_notifications', defaultValue: false)
  final bool accessNotifications;
  @override
  @JsonKey(name: 'access_portal', defaultValue: false)
  final bool accessPortal;
  @override
  @JsonKey(name: 'admin', defaultValue: false)
  final bool admin;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;
  @override
  @JsonKey(name: 'verified_email', defaultValue: false)
  final bool verifiedEmail;
  final List<ReportProblemModel> _reports;
  @override
  @JsonKey(name: 'reports', defaultValue: [])
  List<ReportProblemModel> get reports {
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reports);
  }

  final List<EventModel> _events;
  @override
  @JsonKey(name: 'events', defaultValue: [])
  List<EventModel> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'UserModel(accessAnnouncements: $accessAnnouncements, accessEvents: $accessEvents, accessLocalCouncil: $accessLocalCouncil, accessNotifications: $accessNotifications, accessPortal: $accessPortal, admin: $admin, email: $email, name: $name, phoneNumber: $phoneNumber, verifiedEmail: $verifiedEmail, reports: $reports, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.accessAnnouncements, accessAnnouncements) ||
                other.accessAnnouncements == accessAnnouncements) &&
            (identical(other.accessEvents, accessEvents) ||
                other.accessEvents == accessEvents) &&
            (identical(other.accessLocalCouncil, accessLocalCouncil) ||
                other.accessLocalCouncil == accessLocalCouncil) &&
            (identical(other.accessNotifications, accessNotifications) ||
                other.accessNotifications == accessNotifications) &&
            (identical(other.accessPortal, accessPortal) ||
                other.accessPortal == accessPortal) &&
            (identical(other.admin, admin) || other.admin == admin) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.verifiedEmail, verifiedEmail) ||
                other.verifiedEmail == verifiedEmail) &&
            const DeepCollectionEquality().equals(other._reports, _reports) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accessAnnouncements,
      accessEvents,
      accessLocalCouncil,
      accessNotifications,
      accessPortal,
      admin,
      email,
      name,
      phoneNumber,
      verifiedEmail,
      const DeepCollectionEquality().hash(_reports),
      const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: 'access_announcements', defaultValue: false)
          required final bool accessAnnouncements,
      @JsonKey(name: 'access_events', defaultValue: false)
          required final bool accessEvents,
      @JsonKey(name: 'access_local_council', defaultValue: false)
          required final bool accessLocalCouncil,
      @JsonKey(name: 'access_notifications', defaultValue: false)
          required final bool accessNotifications,
      @JsonKey(name: 'access_portal', defaultValue: false)
          required final bool accessPortal,
      @JsonKey(name: 'admin', defaultValue: false)
          required final bool admin,
      @JsonKey(name: 'email', defaultValue: '')
          required final String email,
      @JsonKey(name: 'name', defaultValue: '')
          required final String name,
      @JsonKey(name: 'phone_number', defaultValue: '')
          required final String phoneNumber,
      @JsonKey(name: 'verified_email', defaultValue: false)
          required final bool verifiedEmail,
      @JsonKey(name: 'reports', defaultValue: [])
          required final List<ReportProblemModel> reports,
      @JsonKey(name: 'events', defaultValue: [])
          required final List<EventModel> events}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @JsonKey(name: 'access_announcements', defaultValue: false)
  bool get accessAnnouncements;
  @override
  @JsonKey(name: 'access_events', defaultValue: false)
  bool get accessEvents;
  @override
  @JsonKey(name: 'access_local_council', defaultValue: false)
  bool get accessLocalCouncil;
  @override
  @JsonKey(name: 'access_notifications', defaultValue: false)
  bool get accessNotifications;
  @override
  @JsonKey(name: 'access_portal', defaultValue: false)
  bool get accessPortal;
  @override
  @JsonKey(name: 'admin', defaultValue: false)
  bool get admin;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  String get email;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'phone_number', defaultValue: '')
  String get phoneNumber;
  @override
  @JsonKey(name: 'verified_email', defaultValue: false)
  bool get verifiedEmail;
  @override
  @JsonKey(name: 'reports', defaultValue: [])
  List<ReportProblemModel> get reports;
  @override
  @JsonKey(name: 'events', defaultValue: [])
  List<EventModel> get events;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
