// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'air_quality_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AirQualityState {
  QualityStatus get qualityStatus => throw _privateConstructorUsedError;
  String? get qualityHtml => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AirQualityStateCopyWith<AirQualityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirQualityStateCopyWith<$Res> {
  factory $AirQualityStateCopyWith(
          AirQualityState value, $Res Function(AirQualityState) then) =
      _$AirQualityStateCopyWithImpl<$Res, AirQualityState>;
  @useResult
  $Res call({QualityStatus qualityStatus, String? qualityHtml});
}

/// @nodoc
class _$AirQualityStateCopyWithImpl<$Res, $Val extends AirQualityState>
    implements $AirQualityStateCopyWith<$Res> {
  _$AirQualityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qualityStatus = null,
    Object? qualityHtml = freezed,
  }) {
    return _then(_value.copyWith(
      qualityStatus: null == qualityStatus
          ? _value.qualityStatus
          : qualityStatus // ignore: cast_nullable_to_non_nullable
              as QualityStatus,
      qualityHtml: freezed == qualityHtml
          ? _value.qualityHtml
          : qualityHtml // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AirQualityStateCopyWith<$Res>
    implements $AirQualityStateCopyWith<$Res> {
  factory _$$_AirQualityStateCopyWith(
          _$_AirQualityState value, $Res Function(_$_AirQualityState) then) =
      __$$_AirQualityStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({QualityStatus qualityStatus, String? qualityHtml});
}

/// @nodoc
class __$$_AirQualityStateCopyWithImpl<$Res>
    extends _$AirQualityStateCopyWithImpl<$Res, _$_AirQualityState>
    implements _$$_AirQualityStateCopyWith<$Res> {
  __$$_AirQualityStateCopyWithImpl(
      _$_AirQualityState _value, $Res Function(_$_AirQualityState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qualityStatus = null,
    Object? qualityHtml = freezed,
  }) {
    return _then(_$_AirQualityState(
      qualityStatus: null == qualityStatus
          ? _value.qualityStatus
          : qualityStatus // ignore: cast_nullable_to_non_nullable
              as QualityStatus,
      qualityHtml: freezed == qualityHtml
          ? _value.qualityHtml
          : qualityHtml // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AirQualityState implements _AirQualityState {
  const _$_AirQualityState(
      {this.qualityStatus = QualityStatus.initial, this.qualityHtml});

  @override
  @JsonKey()
  final QualityStatus qualityStatus;
  @override
  final String? qualityHtml;

  @override
  String toString() {
    return 'AirQualityState(qualityStatus: $qualityStatus, qualityHtml: $qualityHtml)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AirQualityState &&
            (identical(other.qualityStatus, qualityStatus) ||
                other.qualityStatus == qualityStatus) &&
            (identical(other.qualityHtml, qualityHtml) ||
                other.qualityHtml == qualityHtml));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qualityStatus, qualityHtml);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AirQualityStateCopyWith<_$_AirQualityState> get copyWith =>
      __$$_AirQualityStateCopyWithImpl<_$_AirQualityState>(this, _$identity);
}

abstract class _AirQualityState implements AirQualityState {
  const factory _AirQualityState(
      {final QualityStatus qualityStatus,
      final String? qualityHtml}) = _$_AirQualityState;

  @override
  QualityStatus get qualityStatus;
  @override
  String? get qualityHtml;
  @override
  @JsonKey(ignore: true)
  _$$_AirQualityStateCopyWith<_$_AirQualityState> get copyWith =>
      throw _privateConstructorUsedError;
}
