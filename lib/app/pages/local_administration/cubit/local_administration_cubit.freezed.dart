// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_administration_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalAdministrationState {
  NewsState get newsState => throw _privateConstructorUsedError;
  DecisionModel get latestDecision => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalAdministrationStateCopyWith<LocalAdministrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAdministrationStateCopyWith<$Res> {
  factory $LocalAdministrationStateCopyWith(LocalAdministrationState value,
          $Res Function(LocalAdministrationState) then) =
      _$LocalAdministrationStateCopyWithImpl<$Res, LocalAdministrationState>;
  @useResult
  $Res call(
      {NewsState newsState, DecisionModel latestDecision, String? message});

  $DecisionModelCopyWith<$Res> get latestDecision;
}

/// @nodoc
class _$LocalAdministrationStateCopyWithImpl<$Res,
        $Val extends LocalAdministrationState>
    implements $LocalAdministrationStateCopyWith<$Res> {
  _$LocalAdministrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsState = freezed,
    Object? latestDecision = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      newsState: freezed == newsState
          ? _value.newsState
          : newsState // ignore: cast_nullable_to_non_nullable
              as NewsState,
      latestDecision: null == latestDecision
          ? _value.latestDecision
          : latestDecision // ignore: cast_nullable_to_non_nullable
              as DecisionModel,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DecisionModelCopyWith<$Res> get latestDecision {
    return $DecisionModelCopyWith<$Res>(_value.latestDecision, (value) {
      return _then(_value.copyWith(latestDecision: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LocalAdministrationStateCopyWith<$Res>
    implements $LocalAdministrationStateCopyWith<$Res> {
  factory _$$_LocalAdministrationStateCopyWith(
          _$_LocalAdministrationState value,
          $Res Function(_$_LocalAdministrationState) then) =
      __$$_LocalAdministrationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NewsState newsState, DecisionModel latestDecision, String? message});

  @override
  $DecisionModelCopyWith<$Res> get latestDecision;
}

/// @nodoc
class __$$_LocalAdministrationStateCopyWithImpl<$Res>
    extends _$LocalAdministrationStateCopyWithImpl<$Res,
        _$_LocalAdministrationState>
    implements _$$_LocalAdministrationStateCopyWith<$Res> {
  __$$_LocalAdministrationStateCopyWithImpl(_$_LocalAdministrationState _value,
      $Res Function(_$_LocalAdministrationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsState = freezed,
    Object? latestDecision = null,
    Object? message = freezed,
  }) {
    return _then(_$_LocalAdministrationState(
      newsState: freezed == newsState
          ? _value.newsState
          : newsState // ignore: cast_nullable_to_non_nullable
              as NewsState,
      latestDecision: null == latestDecision
          ? _value.latestDecision
          : latestDecision // ignore: cast_nullable_to_non_nullable
              as DecisionModel,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LocalAdministrationState implements _LocalAdministrationState {
  const _$_LocalAdministrationState(
      {required this.newsState, required this.latestDecision, this.message});

  @override
  final NewsState newsState;
  @override
  final DecisionModel latestDecision;
  @override
  final String? message;

  @override
  String toString() {
    return 'LocalAdministrationState(newsState: $newsState, latestDecision: $latestDecision, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalAdministrationState &&
            const DeepCollectionEquality().equals(other.newsState, newsState) &&
            (identical(other.latestDecision, latestDecision) ||
                other.latestDecision == latestDecision) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(newsState), latestDecision, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalAdministrationStateCopyWith<_$_LocalAdministrationState>
      get copyWith => __$$_LocalAdministrationStateCopyWithImpl<
          _$_LocalAdministrationState>(this, _$identity);
}

abstract class _LocalAdministrationState implements LocalAdministrationState {
  const factory _LocalAdministrationState(
      {required final NewsState newsState,
      required final DecisionModel latestDecision,
      final String? message}) = _$_LocalAdministrationState;

  @override
  NewsState get newsState;
  @override
  DecisionModel get latestDecision;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_LocalAdministrationStateCopyWith<_$_LocalAdministrationState>
      get copyWith => throw _privateConstructorUsedError;
}
