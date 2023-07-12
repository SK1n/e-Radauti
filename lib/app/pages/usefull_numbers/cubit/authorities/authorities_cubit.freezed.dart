// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authorities_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthoritiesState {
  PageState get state => throw _privateConstructorUsedError;
  List<AuthoritiesItemModel> get data => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthoritiesStateCopyWith<AuthoritiesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthoritiesStateCopyWith<$Res> {
  factory $AuthoritiesStateCopyWith(
          AuthoritiesState value, $Res Function(AuthoritiesState) then) =
      _$AuthoritiesStateCopyWithImpl<$Res, AuthoritiesState>;
  @useResult
  $Res call(
      {PageState state, List<AuthoritiesItemModel> data, String errorMessage});
}

/// @nodoc
class _$AuthoritiesStateCopyWithImpl<$Res, $Val extends AuthoritiesState>
    implements $AuthoritiesStateCopyWith<$Res> {
  _$AuthoritiesStateCopyWithImpl(this._value, this._then);

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
              as List<AuthoritiesItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthoritiesStateCopyWith<$Res>
    implements $AuthoritiesStateCopyWith<$Res> {
  factory _$$_AuthoritiesStateCopyWith(
          _$_AuthoritiesState value, $Res Function(_$_AuthoritiesState) then) =
      __$$_AuthoritiesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageState state, List<AuthoritiesItemModel> data, String errorMessage});
}

/// @nodoc
class __$$_AuthoritiesStateCopyWithImpl<$Res>
    extends _$AuthoritiesStateCopyWithImpl<$Res, _$_AuthoritiesState>
    implements _$$_AuthoritiesStateCopyWith<$Res> {
  __$$_AuthoritiesStateCopyWithImpl(
      _$_AuthoritiesState _value, $Res Function(_$_AuthoritiesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_AuthoritiesState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PageState,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AuthoritiesItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthoritiesState implements _AuthoritiesState {
  const _$_AuthoritiesState(
      {this.state = PageState.initial,
      final List<AuthoritiesItemModel> data = const [],
      this.errorMessage = ''})
      : _data = data;

  @override
  @JsonKey()
  final PageState state;
  final List<AuthoritiesItemModel> _data;
  @override
  @JsonKey()
  List<AuthoritiesItemModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'AuthoritiesState(state: $state, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthoritiesState &&
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
  _$$_AuthoritiesStateCopyWith<_$_AuthoritiesState> get copyWith =>
      __$$_AuthoritiesStateCopyWithImpl<_$_AuthoritiesState>(this, _$identity);
}

abstract class _AuthoritiesState implements AuthoritiesState {
  const factory _AuthoritiesState(
      {final PageState state,
      final List<AuthoritiesItemModel> data,
      final String errorMessage}) = _$_AuthoritiesState;

  @override
  PageState get state;
  @override
  List<AuthoritiesItemModel> get data;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AuthoritiesStateCopyWith<_$_AuthoritiesState> get copyWith =>
      throw _privateConstructorUsedError;
}
