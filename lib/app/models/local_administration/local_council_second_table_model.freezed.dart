// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_council_second_table_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalCouncilSecondTableModel _$LocalCouncilSecondTableModelFromJson(
    Map<String, dynamic> json) {
  return _LocalCouncilSecondTableModel.fromJson(json);
}

/// @nodoc
mixin _$LocalCouncilSecondTableModel {
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalCouncilSecondTableModelCopyWith<LocalCouncilSecondTableModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalCouncilSecondTableModelCopyWith<$Res> {
  factory $LocalCouncilSecondTableModelCopyWith(
          LocalCouncilSecondTableModel value,
          $Res Function(LocalCouncilSecondTableModel) then) =
      _$LocalCouncilSecondTableModelCopyWithImpl<$Res,
          LocalCouncilSecondTableModel>;
  @useResult
  $Res call({String name, String? email, String? phoneNumber});
}

/// @nodoc
class _$LocalCouncilSecondTableModelCopyWithImpl<$Res,
        $Val extends LocalCouncilSecondTableModel>
    implements $LocalCouncilSecondTableModelCopyWith<$Res> {
  _$LocalCouncilSecondTableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalCouncilSecondTableModelCopyWith<$Res>
    implements $LocalCouncilSecondTableModelCopyWith<$Res> {
  factory _$$_LocalCouncilSecondTableModelCopyWith(
          _$_LocalCouncilSecondTableModel value,
          $Res Function(_$_LocalCouncilSecondTableModel) then) =
      __$$_LocalCouncilSecondTableModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? email, String? phoneNumber});
}

/// @nodoc
class __$$_LocalCouncilSecondTableModelCopyWithImpl<$Res>
    extends _$LocalCouncilSecondTableModelCopyWithImpl<$Res,
        _$_LocalCouncilSecondTableModel>
    implements _$$_LocalCouncilSecondTableModelCopyWith<$Res> {
  __$$_LocalCouncilSecondTableModelCopyWithImpl(
      _$_LocalCouncilSecondTableModel _value,
      $Res Function(_$_LocalCouncilSecondTableModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_LocalCouncilSecondTableModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalCouncilSecondTableModel implements _LocalCouncilSecondTableModel {
  const _$_LocalCouncilSecondTableModel(
      {required this.name, required this.email, required this.phoneNumber});

  factory _$_LocalCouncilSecondTableModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocalCouncilSecondTableModelFromJson(json);

  @override
  final String name;
  @override
  final String? email;
  @override
  final String? phoneNumber;

  @override
  String toString() {
    return 'LocalCouncilSecondTableModel(name: $name, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalCouncilSecondTableModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalCouncilSecondTableModelCopyWith<_$_LocalCouncilSecondTableModel>
      get copyWith => __$$_LocalCouncilSecondTableModelCopyWithImpl<
          _$_LocalCouncilSecondTableModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalCouncilSecondTableModelToJson(
      this,
    );
  }
}

abstract class _LocalCouncilSecondTableModel
    implements LocalCouncilSecondTableModel {
  const factory _LocalCouncilSecondTableModel(
      {required final String name,
      required final String? email,
      required final String? phoneNumber}) = _$_LocalCouncilSecondTableModel;

  factory _LocalCouncilSecondTableModel.fromJson(Map<String, dynamic> json) =
      _$_LocalCouncilSecondTableModel.fromJson;

  @override
  String get name;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_LocalCouncilSecondTableModelCopyWith<_$_LocalCouncilSecondTableModel>
      get copyWith => throw _privateConstructorUsedError;
}
