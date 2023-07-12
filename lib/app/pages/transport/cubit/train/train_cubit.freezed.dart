// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'train_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrainState {
  PageState get state => throw _privateConstructorUsedError;
  List<TrainItemModel> get data => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrainStateCopyWith<TrainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainStateCopyWith<$Res> {
  factory $TrainStateCopyWith(
          TrainState value, $Res Function(TrainState) then) =
      _$TrainStateCopyWithImpl<$Res, TrainState>;
  @useResult
  $Res call({PageState state, List<TrainItemModel> data, String errorMessage});
}

/// @nodoc
class _$TrainStateCopyWithImpl<$Res, $Val extends TrainState>
    implements $TrainStateCopyWith<$Res> {
  _$TrainStateCopyWithImpl(this._value, this._then);

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
              as List<TrainItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrainStateCopyWith<$Res>
    implements $TrainStateCopyWith<$Res> {
  factory _$$_TrainStateCopyWith(
          _$_TrainState value, $Res Function(_$_TrainState) then) =
      __$$_TrainStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PageState state, List<TrainItemModel> data, String errorMessage});
}

/// @nodoc
class __$$_TrainStateCopyWithImpl<$Res>
    extends _$TrainStateCopyWithImpl<$Res, _$_TrainState>
    implements _$$_TrainStateCopyWith<$Res> {
  __$$_TrainStateCopyWithImpl(
      _$_TrainState _value, $Res Function(_$_TrainState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_TrainState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PageState,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TrainItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TrainState implements _TrainState {
  const _$_TrainState(
      {this.state = PageState.initial,
      final List<TrainItemModel> data = const [],
      this.errorMessage = ''})
      : _data = data;

  @override
  @JsonKey()
  final PageState state;
  final List<TrainItemModel> _data;
  @override
  @JsonKey()
  List<TrainItemModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'TrainState(state: $state, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrainState &&
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
  _$$_TrainStateCopyWith<_$_TrainState> get copyWith =>
      __$$_TrainStateCopyWithImpl<_$_TrainState>(this, _$identity);
}

abstract class _TrainState implements TrainState {
  const factory _TrainState(
      {final PageState state,
      final List<TrainItemModel> data,
      final String errorMessage}) = _$_TrainState;

  @override
  PageState get state;
  @override
  List<TrainItemModel> get data;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_TrainStateCopyWith<_$_TrainState> get copyWith =>
      throw _privateConstructorUsedError;
}
