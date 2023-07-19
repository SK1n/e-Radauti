// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteering_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VolunteeringState {
  PageState get state => throw _privateConstructorUsedError;
  List<VolunteeringItemModel> get data => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VolunteeringStateCopyWith<VolunteeringState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolunteeringStateCopyWith<$Res> {
  factory $VolunteeringStateCopyWith(
          VolunteeringState value, $Res Function(VolunteeringState) then) =
      _$VolunteeringStateCopyWithImpl<$Res, VolunteeringState>;
  @useResult
  $Res call(
      {PageState state, List<VolunteeringItemModel> data, String errorMessage});
}

/// @nodoc
class _$VolunteeringStateCopyWithImpl<$Res, $Val extends VolunteeringState>
    implements $VolunteeringStateCopyWith<$Res> {
  _$VolunteeringStateCopyWithImpl(this._value, this._then);

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
              as List<VolunteeringItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VolunteeringStateCopyWith<$Res>
    implements $VolunteeringStateCopyWith<$Res> {
  factory _$$_VolunteeringStateCopyWith(_$_VolunteeringState value,
          $Res Function(_$_VolunteeringState) then) =
      __$$_VolunteeringStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageState state, List<VolunteeringItemModel> data, String errorMessage});
}

/// @nodoc
class __$$_VolunteeringStateCopyWithImpl<$Res>
    extends _$VolunteeringStateCopyWithImpl<$Res, _$_VolunteeringState>
    implements _$$_VolunteeringStateCopyWith<$Res> {
  __$$_VolunteeringStateCopyWithImpl(
      _$_VolunteeringState _value, $Res Function(_$_VolunteeringState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_VolunteeringState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PageState,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<VolunteeringItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VolunteeringState implements _VolunteeringState {
  const _$_VolunteeringState(
      {this.state = PageState.initial,
      final List<VolunteeringItemModel> data = const [],
      this.errorMessage = ''})
      : _data = data;

  @override
  @JsonKey()
  final PageState state;
  final List<VolunteeringItemModel> _data;
  @override
  @JsonKey()
  List<VolunteeringItemModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'VolunteeringState(state: $state, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VolunteeringState &&
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
  _$$_VolunteeringStateCopyWith<_$_VolunteeringState> get copyWith =>
      __$$_VolunteeringStateCopyWithImpl<_$_VolunteeringState>(
          this, _$identity);
}

abstract class _VolunteeringState implements VolunteeringState {
  const factory _VolunteeringState(
      {final PageState state,
      final List<VolunteeringItemModel> data,
      final String errorMessage}) = _$_VolunteeringState;

  @override
  PageState get state;
  @override
  List<VolunteeringItemModel> get data;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_VolunteeringStateCopyWith<_$_VolunteeringState> get copyWith =>
      throw _privateConstructorUsedError;
}
