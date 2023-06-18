// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_problem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportProblemModel _$ReportProblemModelFromJson(Map<String, dynamic> json) {
  return _ReportProblemModel.fromJson(json);
}

/// @nodoc
mixin _$ReportProblemModel {
  @JsonKey(name: 'reports')
  List<ReportProblemItemModel>? get markers =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportProblemModelCopyWith<ReportProblemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportProblemModelCopyWith<$Res> {
  factory $ReportProblemModelCopyWith(
          ReportProblemModel value, $Res Function(ReportProblemModel) then) =
      _$ReportProblemModelCopyWithImpl<$Res, ReportProblemModel>;
  @useResult
  $Res call({@JsonKey(name: 'reports') List<ReportProblemItemModel>? markers});
}

/// @nodoc
class _$ReportProblemModelCopyWithImpl<$Res, $Val extends ReportProblemModel>
    implements $ReportProblemModelCopyWith<$Res> {
  _$ReportProblemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = freezed,
  }) {
    return _then(_value.copyWith(
      markers: freezed == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<ReportProblemItemModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportProblemModelCopyWith<$Res>
    implements $ReportProblemModelCopyWith<$Res> {
  factory _$$_ReportProblemModelCopyWith(_$_ReportProblemModel value,
          $Res Function(_$_ReportProblemModel) then) =
      __$$_ReportProblemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'reports') List<ReportProblemItemModel>? markers});
}

/// @nodoc
class __$$_ReportProblemModelCopyWithImpl<$Res>
    extends _$ReportProblemModelCopyWithImpl<$Res, _$_ReportProblemModel>
    implements _$$_ReportProblemModelCopyWith<$Res> {
  __$$_ReportProblemModelCopyWithImpl(
      _$_ReportProblemModel _value, $Res Function(_$_ReportProblemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = freezed,
  }) {
    return _then(_$_ReportProblemModel(
      markers: freezed == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<ReportProblemItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportProblemModel
    with DiagnosticableTreeMixin
    implements _ReportProblemModel {
  const _$_ReportProblemModel(
      {@JsonKey(name: 'reports')
          required final List<ReportProblemItemModel>? markers})
      : _markers = markers;

  factory _$_ReportProblemModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReportProblemModelFromJson(json);

  final List<ReportProblemItemModel>? _markers;
  @override
  @JsonKey(name: 'reports')
  List<ReportProblemItemModel>? get markers {
    final value = _markers;
    if (value == null) return null;
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportProblemModel(markers: $markers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportProblemModel'))
      ..add(DiagnosticsProperty('markers', markers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportProblemModel &&
            const DeepCollectionEquality().equals(other._markers, _markers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_markers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportProblemModelCopyWith<_$_ReportProblemModel> get copyWith =>
      __$$_ReportProblemModelCopyWithImpl<_$_ReportProblemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportProblemModelToJson(
      this,
    );
  }
}

abstract class _ReportProblemModel implements ReportProblemModel {
  const factory _ReportProblemModel(
          {@JsonKey(name: 'reports')
              required final List<ReportProblemItemModel>? markers}) =
      _$_ReportProblemModel;

  factory _ReportProblemModel.fromJson(Map<String, dynamic> json) =
      _$_ReportProblemModel.fromJson;

  @override
  @JsonKey(name: 'reports')
  List<ReportProblemItemModel>? get markers;
  @override
  @JsonKey(ignore: true)
  _$$_ReportProblemModelCopyWith<_$_ReportProblemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
