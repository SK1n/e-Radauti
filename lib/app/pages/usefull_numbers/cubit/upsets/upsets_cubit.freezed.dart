// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upsets_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpsetsState {
  PageState get state => throw _privateConstructorUsedError;
  List<UpsetsItemModel> get data => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpsetsStateCopyWith<UpsetsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpsetsStateCopyWith<$Res> {
  factory $UpsetsStateCopyWith(
          UpsetsState value, $Res Function(UpsetsState) then) =
      _$UpsetsStateCopyWithImpl<$Res, UpsetsState>;
  @useResult
  $Res call({PageState state, List<UpsetsItemModel> data, String errorMessage});
}

/// @nodoc
class _$UpsetsStateCopyWithImpl<$Res, $Val extends UpsetsState>
    implements $UpsetsStateCopyWith<$Res> {
  _$UpsetsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PageState,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UpsetsItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpsetsStateCopyWith<$Res>
    implements $UpsetsStateCopyWith<$Res> {
  factory _$$_UpsetsStateCopyWith(
          _$_UpsetsState value, $Res Function(_$_UpsetsState) then) =
      __$$_UpsetsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PageState state, List<UpsetsItemModel> data, String errorMessage});
}

/// @nodoc
class __$$_UpsetsStateCopyWithImpl<$Res>
    extends _$UpsetsStateCopyWithImpl<$Res, _$_UpsetsState>
    implements _$$_UpsetsStateCopyWith<$Res> {
  __$$_UpsetsStateCopyWithImpl(
      _$_UpsetsState _value, $Res Function(_$_UpsetsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_UpsetsState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PageState,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UpsetsItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpsetsState implements _UpsetsState {
  const _$_UpsetsState(
      {this.state = PageState.initial,
      final List<UpsetsItemModel> data = const [],
      this.errorMessage = ''})
      : _data = data;

  @override
  @JsonKey()
  final PageState state;
  final List<UpsetsItemModel> _data;
  @override
  @JsonKey()
  List<UpsetsItemModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'UpsetsState(state: $state, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpsetsState &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state,
      const DeepCollectionEquality().hash(_data), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpsetsStateCopyWith<_$_UpsetsState> get copyWith =>
      __$$_UpsetsStateCopyWithImpl<_$_UpsetsState>(this, _$identity);
}

abstract class _UpsetsState implements UpsetsState {
  const factory _UpsetsState(
      {final PageState state,
      final List<UpsetsItemModel> data,
      final String errorMessage}) = _$_UpsetsState;

  @override
  PageState get state;
  @override
  List<UpsetsItemModel> get data;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_UpsetsStateCopyWith<_$_UpsetsState> get copyWith =>
      throw _privateConstructorUsedError;
}
