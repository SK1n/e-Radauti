// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decision_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DecisionModel _$DecisionModelFromJson(Map<String, dynamic> json) {
  return _DecisionModel.fromJson(json);
}

/// @nodoc
mixin _$DecisionModel {
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DecisionModelCopyWith<DecisionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecisionModelCopyWith<$Res> {
  factory $DecisionModelCopyWith(
          DecisionModel value, $Res Function(DecisionModel) then) =
      _$DecisionModelCopyWithImpl<$Res, DecisionModel>;
  @useResult
  $Res call({String title, String url, String year});
}

/// @nodoc
class _$DecisionModelCopyWithImpl<$Res, $Val extends DecisionModel>
    implements $DecisionModelCopyWith<$Res> {
  _$DecisionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? year = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DecisionModelCopyWith<$Res>
    implements $DecisionModelCopyWith<$Res> {
  factory _$$_DecisionModelCopyWith(
          _$_DecisionModel value, $Res Function(_$_DecisionModel) then) =
      __$$_DecisionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String url, String year});
}

/// @nodoc
class __$$_DecisionModelCopyWithImpl<$Res>
    extends _$DecisionModelCopyWithImpl<$Res, _$_DecisionModel>
    implements _$$_DecisionModelCopyWith<$Res> {
  __$$_DecisionModelCopyWithImpl(
      _$_DecisionModel _value, $Res Function(_$_DecisionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? year = null,
  }) {
    return _then(_$_DecisionModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DecisionModel implements _DecisionModel {
  const _$_DecisionModel(
      {required this.title, required this.url, required this.year});

  factory _$_DecisionModel.fromJson(Map<String, dynamic> json) =>
      _$$_DecisionModelFromJson(json);

  @override
  final String title;
  @override
  final String url;
  @override
  final String year;

  @override
  String toString() {
    return 'DecisionModel(title: $title, url: $url, year: $year)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DecisionModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.year, year) || other.year == year));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, url, year);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DecisionModelCopyWith<_$_DecisionModel> get copyWith =>
      __$$_DecisionModelCopyWithImpl<_$_DecisionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DecisionModelToJson(
      this,
    );
  }
}

abstract class _DecisionModel implements DecisionModel {
  const factory _DecisionModel(
      {required final String title,
      required final String url,
      required final String year}) = _$_DecisionModel;

  factory _DecisionModel.fromJson(Map<String, dynamic> json) =
      _$_DecisionModel.fromJson;

  @override
  String get title;
  @override
  String get url;
  @override
  String get year;
  @override
  @JsonKey(ignore: true)
  _$$_DecisionModelCopyWith<_$_DecisionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
