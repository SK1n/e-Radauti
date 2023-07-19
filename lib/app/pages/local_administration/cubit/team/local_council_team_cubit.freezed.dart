// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_council_team_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalCouncilTeamState {
  PageState get state => throw _privateConstructorUsedError;
  List<LocalCouncilItemModel> get data => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalCouncilTeamStateCopyWith<LocalCouncilTeamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalCouncilTeamStateCopyWith<$Res> {
  factory $LocalCouncilTeamStateCopyWith(LocalCouncilTeamState value,
          $Res Function(LocalCouncilTeamState) then) =
      _$LocalCouncilTeamStateCopyWithImpl<$Res, LocalCouncilTeamState>;
  @useResult
  $Res call(
      {PageState state, List<LocalCouncilItemModel> data, String errorMessage});
}

/// @nodoc
class _$LocalCouncilTeamStateCopyWithImpl<$Res,
        $Val extends LocalCouncilTeamState>
    implements $LocalCouncilTeamStateCopyWith<$Res> {
  _$LocalCouncilTeamStateCopyWithImpl(this._value, this._then);

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
              as List<LocalCouncilItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalCouncilTeamStateCopyWith<$Res>
    implements $LocalCouncilTeamStateCopyWith<$Res> {
  factory _$$_LocalCouncilTeamStateCopyWith(_$_LocalCouncilTeamState value,
          $Res Function(_$_LocalCouncilTeamState) then) =
      __$$_LocalCouncilTeamStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageState state, List<LocalCouncilItemModel> data, String errorMessage});
}

/// @nodoc
class __$$_LocalCouncilTeamStateCopyWithImpl<$Res>
    extends _$LocalCouncilTeamStateCopyWithImpl<$Res, _$_LocalCouncilTeamState>
    implements _$$_LocalCouncilTeamStateCopyWith<$Res> {
  __$$_LocalCouncilTeamStateCopyWithImpl(_$_LocalCouncilTeamState _value,
      $Res Function(_$_LocalCouncilTeamState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_LocalCouncilTeamState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PageState,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LocalCouncilItemModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocalCouncilTeamState implements _LocalCouncilTeamState {
  const _$_LocalCouncilTeamState(
      {this.state = PageState.initial,
      final List<LocalCouncilItemModel> data = const [],
      this.errorMessage = ''})
      : _data = data;

  @override
  @JsonKey()
  final PageState state;
  final List<LocalCouncilItemModel> _data;
  @override
  @JsonKey()
  List<LocalCouncilItemModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'LocalCouncilTeamState(state: $state, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalCouncilTeamState &&
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
  _$$_LocalCouncilTeamStateCopyWith<_$_LocalCouncilTeamState> get copyWith =>
      __$$_LocalCouncilTeamStateCopyWithImpl<_$_LocalCouncilTeamState>(
          this, _$identity);
}

abstract class _LocalCouncilTeamState implements LocalCouncilTeamState {
  const factory _LocalCouncilTeamState(
      {final PageState state,
      final List<LocalCouncilItemModel> data,
      final String errorMessage}) = _$_LocalCouncilTeamState;

  @override
  PageState get state;
  @override
  List<LocalCouncilItemModel> get data;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_LocalCouncilTeamStateCopyWith<_$_LocalCouncilTeamState> get copyWith =>
      throw _privateConstructorUsedError;
}
