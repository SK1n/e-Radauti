// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_problem_marker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportProblemMarkerModel _$ReportProblemMarkerModelFromJson(
    Map<String, dynamic> json) {
  return _ReportProblemMarkerModel.fromJson(json);
}

/// @nodoc
mixin _$ReportProblemMarkerModel {
  @JsonKey(name: 'markers')
  List<ReportProblemItemModel>? get markers =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportProblemMarkerModelCopyWith<ReportProblemMarkerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportProblemMarkerModelCopyWith<$Res> {
  factory $ReportProblemMarkerModelCopyWith(ReportProblemMarkerModel value,
          $Res Function(ReportProblemMarkerModel) then) =
      _$ReportProblemMarkerModelCopyWithImpl<$Res, ReportProblemMarkerModel>;
  @useResult
  $Res call({@JsonKey(name: 'markers') List<ReportProblemItemModel>? markers});
}

/// @nodoc
class _$ReportProblemMarkerModelCopyWithImpl<$Res,
        $Val extends ReportProblemMarkerModel>
    implements $ReportProblemMarkerModelCopyWith<$Res> {
  _$ReportProblemMarkerModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_ReportProblemMarkerModelCopyWith<$Res>
    implements $ReportProblemMarkerModelCopyWith<$Res> {
  factory _$$_ReportProblemMarkerModelCopyWith(
          _$_ReportProblemMarkerModel value,
          $Res Function(_$_ReportProblemMarkerModel) then) =
      __$$_ReportProblemMarkerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'markers') List<ReportProblemItemModel>? markers});
}

/// @nodoc
class __$$_ReportProblemMarkerModelCopyWithImpl<$Res>
    extends _$ReportProblemMarkerModelCopyWithImpl<$Res,
        _$_ReportProblemMarkerModel>
    implements _$$_ReportProblemMarkerModelCopyWith<$Res> {
  __$$_ReportProblemMarkerModelCopyWithImpl(_$_ReportProblemMarkerModel _value,
      $Res Function(_$_ReportProblemMarkerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = freezed,
  }) {
    return _then(_$_ReportProblemMarkerModel(
      markers: freezed == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<ReportProblemItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportProblemMarkerModel
    with DiagnosticableTreeMixin
    implements _ReportProblemMarkerModel {
  const _$_ReportProblemMarkerModel(
      {@JsonKey(name: 'markers')
          required final List<ReportProblemItemModel>? markers})
      : _markers = markers;

  factory _$_ReportProblemMarkerModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReportProblemMarkerModelFromJson(json);

  final List<ReportProblemItemModel>? _markers;
  @override
  @JsonKey(name: 'markers')
  List<ReportProblemItemModel>? get markers {
    final value = _markers;
    if (value == null) return null;
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportProblemMarkerModel(markers: $markers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportProblemMarkerModel'))
      ..add(DiagnosticsProperty('markers', markers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportProblemMarkerModel &&
            const DeepCollectionEquality().equals(other._markers, _markers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_markers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportProblemMarkerModelCopyWith<_$_ReportProblemMarkerModel>
      get copyWith => __$$_ReportProblemMarkerModelCopyWithImpl<
          _$_ReportProblemMarkerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportProblemMarkerModelToJson(
      this,
    );
  }
}

abstract class _ReportProblemMarkerModel implements ReportProblemMarkerModel {
  const factory _ReportProblemMarkerModel(
          {@JsonKey(name: 'markers')
              required final List<ReportProblemItemModel>? markers}) =
      _$_ReportProblemMarkerModel;

  factory _ReportProblemMarkerModel.fromJson(Map<String, dynamic> json) =
      _$_ReportProblemMarkerModel.fromJson;

  @override
  @JsonKey(name: 'markers')
  List<ReportProblemItemModel>? get markers;
  @override
  @JsonKey(ignore: true)
  _$$_ReportProblemMarkerModelCopyWith<_$_ReportProblemMarkerModel>
      get copyWith => throw _privateConstructorUsedError;
}
