// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_problem_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportProblemUserModel _$ReportProblemUserModelFromJson(
    Map<String, dynamic> json) {
  return _ReportProblemUserModel.fromJson(json);
}

/// @nodoc
mixin _$ReportProblemUserModel {
  @JsonKey(name: 'reports', defaultValue: [])
  List<ReportProblemUserItemModel> get markers =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportProblemUserModelCopyWith<ReportProblemUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportProblemUserModelCopyWith<$Res> {
  factory $ReportProblemUserModelCopyWith(ReportProblemUserModel value,
          $Res Function(ReportProblemUserModel) then) =
      _$ReportProblemUserModelCopyWithImpl<$Res, ReportProblemUserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reports', defaultValue: [])
          List<ReportProblemUserItemModel> markers});
}

/// @nodoc
class _$ReportProblemUserModelCopyWithImpl<$Res,
        $Val extends ReportProblemUserModel>
    implements $ReportProblemUserModelCopyWith<$Res> {
  _$ReportProblemUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
  }) {
    return _then(_value.copyWith(
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<ReportProblemUserItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportProblemUserModelCopyWith<$Res>
    implements $ReportProblemUserModelCopyWith<$Res> {
  factory _$$_ReportProblemUserModelCopyWith(_$_ReportProblemUserModel value,
          $Res Function(_$_ReportProblemUserModel) then) =
      __$$_ReportProblemUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reports', defaultValue: [])
          List<ReportProblemUserItemModel> markers});
}

/// @nodoc
class __$$_ReportProblemUserModelCopyWithImpl<$Res>
    extends _$ReportProblemUserModelCopyWithImpl<$Res,
        _$_ReportProblemUserModel>
    implements _$$_ReportProblemUserModelCopyWith<$Res> {
  __$$_ReportProblemUserModelCopyWithImpl(_$_ReportProblemUserModel _value,
      $Res Function(_$_ReportProblemUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
  }) {
    return _then(_$_ReportProblemUserModel(
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<ReportProblemUserItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportProblemUserModel
    with DiagnosticableTreeMixin
    implements _ReportProblemUserModel {
  const _$_ReportProblemUserModel(
      {@JsonKey(name: 'reports', defaultValue: [])
          required final List<ReportProblemUserItemModel> markers})
      : _markers = markers;

  factory _$_ReportProblemUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReportProblemUserModelFromJson(json);

  final List<ReportProblemUserItemModel> _markers;
  @override
  @JsonKey(name: 'reports', defaultValue: [])
  List<ReportProblemUserItemModel> get markers {
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markers);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportProblemUserModel(markers: $markers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportProblemUserModel'))
      ..add(DiagnosticsProperty('markers', markers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportProblemUserModel &&
            const DeepCollectionEquality().equals(other._markers, _markers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_markers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportProblemUserModelCopyWith<_$_ReportProblemUserModel> get copyWith =>
      __$$_ReportProblemUserModelCopyWithImpl<_$_ReportProblemUserModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportProblemUserModelToJson(
      this,
    );
  }
}

abstract class _ReportProblemUserModel implements ReportProblemUserModel {
  const factory _ReportProblemUserModel(
          {@JsonKey(name: 'reports', defaultValue: [])
              required final List<ReportProblemUserItemModel> markers}) =
      _$_ReportProblemUserModel;

  factory _ReportProblemUserModel.fromJson(Map<String, dynamic> json) =
      _$_ReportProblemUserModel.fromJson;

  @override
  @JsonKey(name: 'reports', defaultValue: [])
  List<ReportProblemUserItemModel> get markers;
  @override
  @JsonKey(ignore: true)
  _$$_ReportProblemUserModelCopyWith<_$_ReportProblemUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportProblemUserItemModel _$ReportProblemUserItemModelFromJson(
    Map<String, dynamic> json) {
  return _ReportProblemUserItemModel.fromJson(json);
}

/// @nodoc
mixin _$ReportProblemUserItemModel {
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get institution => throw _privateConstructorUsedError;
  @JsonKey(name: 'institution_email')
  String get institutionEmail => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get long => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  List<String> get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportProblemUserItemModelCopyWith<ReportProblemUserItemModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportProblemUserItemModelCopyWith<$Res> {
  factory $ReportProblemUserItemModelCopyWith(ReportProblemUserItemModel value,
          $Res Function(ReportProblemUserItemModel) then) =
      _$ReportProblemUserItemModelCopyWithImpl<$Res,
          ReportProblemUserItemModel>;
  @useResult
  $Res call(
      {String category,
      String description,
      String email,
      int index,
      String institution,
      @JsonKey(name: 'institution_email') String institutionEmail,
      double? lat,
      double? long,
      String name,
      String phone,
      String status,
      String subject,
      @JsonKey(name: 'created_at') String? createdAt,
      List<String> url});
}

/// @nodoc
class _$ReportProblemUserItemModelCopyWithImpl<$Res,
        $Val extends ReportProblemUserItemModel>
    implements $ReportProblemUserItemModelCopyWith<$Res> {
  _$ReportProblemUserItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? description = null,
    Object? email = null,
    Object? index = null,
    Object? institution = null,
    Object? institutionEmail = null,
    Object? lat = freezed,
    Object? long = freezed,
    Object? name = null,
    Object? phone = null,
    Object? status = null,
    Object? subject = null,
    Object? createdAt = freezed,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      institution: null == institution
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as String,
      institutionEmail: null == institutionEmail
          ? _value.institutionEmail
          : institutionEmail // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportProblemUserItemModelCopyWith<$Res>
    implements $ReportProblemUserItemModelCopyWith<$Res> {
  factory _$$_ReportProblemUserItemModelCopyWith(
          _$_ReportProblemUserItemModel value,
          $Res Function(_$_ReportProblemUserItemModel) then) =
      __$$_ReportProblemUserItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String description,
      String email,
      int index,
      String institution,
      @JsonKey(name: 'institution_email') String institutionEmail,
      double? lat,
      double? long,
      String name,
      String phone,
      String status,
      String subject,
      @JsonKey(name: 'created_at') String? createdAt,
      List<String> url});
}

/// @nodoc
class __$$_ReportProblemUserItemModelCopyWithImpl<$Res>
    extends _$ReportProblemUserItemModelCopyWithImpl<$Res,
        _$_ReportProblemUserItemModel>
    implements _$$_ReportProblemUserItemModelCopyWith<$Res> {
  __$$_ReportProblemUserItemModelCopyWithImpl(
      _$_ReportProblemUserItemModel _value,
      $Res Function(_$_ReportProblemUserItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? description = null,
    Object? email = null,
    Object? index = null,
    Object? institution = null,
    Object? institutionEmail = null,
    Object? lat = freezed,
    Object? long = freezed,
    Object? name = null,
    Object? phone = null,
    Object? status = null,
    Object? subject = null,
    Object? createdAt = freezed,
    Object? url = null,
  }) {
    return _then(_$_ReportProblemUserItemModel(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      institution: null == institution
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as String,
      institutionEmail: null == institutionEmail
          ? _value.institutionEmail
          : institutionEmail // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value._url
          : url // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportProblemUserItemModel
    with DiagnosticableTreeMixin
    implements _ReportProblemUserItemModel {
  const _$_ReportProblemUserItemModel(
      {required this.category,
      required this.description,
      required this.email,
      required this.index,
      required this.institution,
      @JsonKey(name: 'institution_email') required this.institutionEmail,
      this.lat,
      this.long,
      required this.name,
      required this.phone,
      required this.status,
      required this.subject,
      @JsonKey(name: 'created_at') this.createdAt,
      required final List<String> url})
      : _url = url;

  factory _$_ReportProblemUserItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReportProblemUserItemModelFromJson(json);

  @override
  final String category;
  @override
  final String description;
  @override
  final String email;
  @override
  final int index;
  @override
  final String institution;
  @override
  @JsonKey(name: 'institution_email')
  final String institutionEmail;
  @override
  final double? lat;
  @override
  final double? long;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String status;
  @override
  final String subject;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final List<String> _url;
  @override
  List<String> get url {
    if (_url is EqualUnmodifiableListView) return _url;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_url);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportProblemUserItemModel(category: $category, description: $description, email: $email, index: $index, institution: $institution, institutionEmail: $institutionEmail, lat: $lat, long: $long, name: $name, phone: $phone, status: $status, subject: $subject, createdAt: $createdAt, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportProblemUserItemModel'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('institution', institution))
      ..add(DiagnosticsProperty('institutionEmail', institutionEmail))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('long', long))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('subject', subject))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportProblemUserItemModel &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.institution, institution) ||
                other.institution == institution) &&
            (identical(other.institutionEmail, institutionEmail) ||
                other.institutionEmail == institutionEmail) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._url, _url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      description,
      email,
      index,
      institution,
      institutionEmail,
      lat,
      long,
      name,
      phone,
      status,
      subject,
      createdAt,
      const DeepCollectionEquality().hash(_url));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportProblemUserItemModelCopyWith<_$_ReportProblemUserItemModel>
      get copyWith => __$$_ReportProblemUserItemModelCopyWithImpl<
          _$_ReportProblemUserItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportProblemUserItemModelToJson(
      this,
    );
  }
}

abstract class _ReportProblemUserItemModel
    implements ReportProblemUserItemModel {
  const factory _ReportProblemUserItemModel(
      {required final String category,
      required final String description,
      required final String email,
      required final int index,
      required final String institution,
      @JsonKey(name: 'institution_email')
          required final String institutionEmail,
      final double? lat,
      final double? long,
      required final String name,
      required final String phone,
      required final String status,
      required final String subject,
      @JsonKey(name: 'created_at')
          final String? createdAt,
      required final List<String> url}) = _$_ReportProblemUserItemModel;

  factory _ReportProblemUserItemModel.fromJson(Map<String, dynamic> json) =
      _$_ReportProblemUserItemModel.fromJson;

  @override
  String get category;
  @override
  String get description;
  @override
  String get email;
  @override
  int get index;
  @override
  String get institution;
  @override
  @JsonKey(name: 'institution_email')
  String get institutionEmail;
  @override
  double? get lat;
  @override
  double? get long;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get status;
  @override
  String get subject;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  List<String> get url;
  @override
  @JsonKey(ignore: true)
  _$$_ReportProblemUserItemModelCopyWith<_$_ReportProblemUserItemModel>
      get copyWith => throw _privateConstructorUsedError;
}
