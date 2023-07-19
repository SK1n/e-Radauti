// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taxi_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaxiState {
  PageState get state => throw _privateConstructorUsedError;
  List<TaxiItemModel> get data => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaxiStateCopyWith<TaxiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxiStateCopyWith<$Res> {
  factory $TaxiStateCopyWith(TaxiState value, $Res Function(TaxiState) then) =
      _$TaxiStateCopyWithImpl<$Res, TaxiState>;
  @useResult
  $Res call({PageState state, List<TaxiItemModel> data, String errorMessage});
}

/// @nodoc
class _$TaxiStateCopyWithImpl<$Res, $Val extends TaxiState>
    implements $TaxiStateCopyWith<$Res> {
  _$TaxiStateCopyWithImpl(this._value, this._then);

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
              as List<TaxiItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaxiStateCopyWith<$Res> implements $TaxiStateCopyWith<$Res> {
  factory _$$_TaxiStateCopyWith(
          _$_TaxiState value, $Res Function(_$_TaxiState) then) =
      __$$_TaxiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PageState state, List<TaxiItemModel> data, String errorMessage});
}

/// @nodoc
class __$$_TaxiStateCopyWithImpl<$Res>
    extends _$TaxiStateCopyWithImpl<$Res, _$_TaxiState>
    implements _$$_TaxiStateCopyWith<$Res> {
  __$$_TaxiStateCopyWithImpl(
      _$_TaxiState _value, $Res Function(_$_TaxiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_TaxiState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PageState,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TaxiItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TaxiState implements _TaxiState {
  const _$_TaxiState(
      {this.state = PageState.initial,
      final List<TaxiItemModel> data = const [],
      this.errorMessage = ''})
      : _data = data;

  @override
  @JsonKey()
  final PageState state;
  final List<TaxiItemModel> _data;
  @override
  @JsonKey()
  List<TaxiItemModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'TaxiState(state: $state, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaxiState &&
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
  _$$_TaxiStateCopyWith<_$_TaxiState> get copyWith =>
      __$$_TaxiStateCopyWithImpl<_$_TaxiState>(this, _$identity);
}

abstract class _TaxiState implements TaxiState {
  const factory _TaxiState(
      {final PageState state,
      final List<TaxiItemModel> data,
      final String errorMessage}) = _$_TaxiState;

  @override
  PageState get state;
  @override
  List<TaxiItemModel> get data;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_TaxiStateCopyWith<_$_TaxiState> get copyWith =>
      throw _privateConstructorUsedError;
}
