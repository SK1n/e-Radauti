// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobs_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JobsState {
  PageState get state => throw _privateConstructorUsedError;
  List<ERadautiWebsiteRecordsModel> get data =>
      throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JobsStateCopyWith<JobsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobsStateCopyWith<$Res> {
  factory $JobsStateCopyWith(JobsState value, $Res Function(JobsState) then) =
      _$JobsStateCopyWithImpl<$Res, JobsState>;
  @useResult
  $Res call(
      {PageState state,
      List<ERadautiWebsiteRecordsModel> data,
      String errorMessage});
}

/// @nodoc
class _$JobsStateCopyWithImpl<$Res, $Val extends JobsState>
    implements $JobsStateCopyWith<$Res> {
  _$JobsStateCopyWithImpl(this._value, this._then);

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
              as List<ERadautiWebsiteRecordsModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobsStateCopyWith<$Res> implements $JobsStateCopyWith<$Res> {
  factory _$$_JobsStateCopyWith(
          _$_JobsState value, $Res Function(_$_JobsState) then) =
      __$$_JobsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageState state,
      List<ERadautiWebsiteRecordsModel> data,
      String errorMessage});
}

/// @nodoc
class __$$_JobsStateCopyWithImpl<$Res>
    extends _$JobsStateCopyWithImpl<$Res, _$_JobsState>
    implements _$$_JobsStateCopyWith<$Res> {
  __$$_JobsStateCopyWithImpl(
      _$_JobsState _value, $Res Function(_$_JobsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_JobsState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PageState,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ERadautiWebsiteRecordsModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_JobsState implements _JobsState {
  const _$_JobsState(
      {this.state = PageState.initial,
      final List<ERadautiWebsiteRecordsModel> data = const [],
      this.errorMessage = ''})
      : _data = data;

  @override
  @JsonKey()
  final PageState state;
  final List<ERadautiWebsiteRecordsModel> _data;
  @override
  @JsonKey()
  List<ERadautiWebsiteRecordsModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'JobsState(state: $state, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobsState &&
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
  _$$_JobsStateCopyWith<_$_JobsState> get copyWith =>
      __$$_JobsStateCopyWithImpl<_$_JobsState>(this, _$identity);
}

abstract class _JobsState implements JobsState {
  const factory _JobsState(
      {final PageState state,
      final List<ERadautiWebsiteRecordsModel> data,
      final String errorMessage}) = _$_JobsState;

  @override
  PageState get state;
  @override
  List<ERadautiWebsiteRecordsModel> get data;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_JobsStateCopyWith<_$_JobsState> get copyWith =>
      throw _privateConstructorUsedError;
}
