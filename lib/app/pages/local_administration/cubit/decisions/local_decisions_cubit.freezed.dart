// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_decisions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalDecisionsState {
  PageState get state => throw _privateConstructorUsedError;
  List<DecisionModel> get data => throw _privateConstructorUsedError;
  List<DecisionModel> get dataFilter => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalDecisionsStateCopyWith<LocalDecisionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalDecisionsStateCopyWith<$Res> {
  factory $LocalDecisionsStateCopyWith(
          LocalDecisionsState value, $Res Function(LocalDecisionsState) then) =
      _$LocalDecisionsStateCopyWithImpl<$Res, LocalDecisionsState>;
  @useResult
  $Res call(
      {PageState state,
      List<DecisionModel> data,
      List<DecisionModel> dataFilter,
      String errorMessage});
}

/// @nodoc
class _$LocalDecisionsStateCopyWithImpl<$Res, $Val extends LocalDecisionsState>
    implements $LocalDecisionsStateCopyWith<$Res> {
  _$LocalDecisionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? dataFilter = null,
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
              as List<DecisionModel>,
      dataFilter: null == dataFilter
          ? _value.dataFilter
          : dataFilter // ignore: cast_nullable_to_non_nullable
              as List<DecisionModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalDecisionsCubitCopyWith<$Res>
    implements $LocalDecisionsStateCopyWith<$Res> {
  factory _$$_LocalDecisionsCubitCopyWith(_$_LocalDecisionsCubit value,
          $Res Function(_$_LocalDecisionsCubit) then) =
      __$$_LocalDecisionsCubitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageState state,
      List<DecisionModel> data,
      List<DecisionModel> dataFilter,
      String errorMessage});
}

/// @nodoc
class __$$_LocalDecisionsCubitCopyWithImpl<$Res>
    extends _$LocalDecisionsStateCopyWithImpl<$Res, _$_LocalDecisionsCubit>
    implements _$$_LocalDecisionsCubitCopyWith<$Res> {
  __$$_LocalDecisionsCubitCopyWithImpl(_$_LocalDecisionsCubit _value,
      $Res Function(_$_LocalDecisionsCubit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? data = null,
    Object? dataFilter = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_LocalDecisionsCubit(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PageState,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DecisionModel>,
      dataFilter: null == dataFilter
          ? _value._dataFilter
          : dataFilter // ignore: cast_nullable_to_non_nullable
              as List<DecisionModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocalDecisionsCubit implements _LocalDecisionsCubit {
  const _$_LocalDecisionsCubit(
      {this.state = PageState.initial,
      final List<DecisionModel> data = const [],
      final List<DecisionModel> dataFilter = const [],
      this.errorMessage = ''})
      : _data = data,
        _dataFilter = dataFilter;

  @override
  @JsonKey()
  final PageState state;
  final List<DecisionModel> _data;
  @override
  @JsonKey()
  List<DecisionModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final List<DecisionModel> _dataFilter;
  @override
  @JsonKey()
  List<DecisionModel> get dataFilter {
    if (_dataFilter is EqualUnmodifiableListView) return _dataFilter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataFilter);
  }

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'LocalDecisionsState(state: $state, data: $data, dataFilter: $dataFilter, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalDecisionsCubit &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other._dataFilter, _dataFilter) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      state,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_dataFilter),
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalDecisionsCubitCopyWith<_$_LocalDecisionsCubit> get copyWith =>
      __$$_LocalDecisionsCubitCopyWithImpl<_$_LocalDecisionsCubit>(
          this, _$identity);
}

abstract class _LocalDecisionsCubit implements LocalDecisionsState {
  const factory _LocalDecisionsCubit(
      {final PageState state,
      final List<DecisionModel> data,
      final List<DecisionModel> dataFilter,
      final String errorMessage}) = _$_LocalDecisionsCubit;

  @override
  PageState get state;
  @override
  List<DecisionModel> get data;
  @override
  List<DecisionModel> get dataFilter;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_LocalDecisionsCubitCopyWith<_$_LocalDecisionsCubit> get copyWith =>
      throw _privateConstructorUsedError;
}
