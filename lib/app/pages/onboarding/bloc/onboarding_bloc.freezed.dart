// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingState {
  PageState get pageState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  NotificationsPermissions get notificationsPermissions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call(
      {PageState pageState,
      String message,
      bool notificationsEnabled,
      NotificationsPermissions notificationsPermissions});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageState = null,
    Object? message = null,
    Object? notificationsEnabled = null,
    Object? notificationsPermissions = null,
  }) {
    return _then(_value.copyWith(
      pageState: null == pageState
          ? _value.pageState
          : pageState // ignore: cast_nullable_to_non_nullable
              as PageState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationsPermissions: null == notificationsPermissions
          ? _value.notificationsPermissions
          : notificationsPermissions // ignore: cast_nullable_to_non_nullable
              as NotificationsPermissions,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnboardingStateCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$_OnboardingStateCopyWith(
          _$_OnboardingState value, $Res Function(_$_OnboardingState) then) =
      __$$_OnboardingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageState pageState,
      String message,
      bool notificationsEnabled,
      NotificationsPermissions notificationsPermissions});
}

/// @nodoc
class __$$_OnboardingStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$_OnboardingState>
    implements _$$_OnboardingStateCopyWith<$Res> {
  __$$_OnboardingStateCopyWithImpl(
      _$_OnboardingState _value, $Res Function(_$_OnboardingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageState = null,
    Object? message = null,
    Object? notificationsEnabled = null,
    Object? notificationsPermissions = null,
  }) {
    return _then(_$_OnboardingState(
      pageState: null == pageState
          ? _value.pageState
          : pageState // ignore: cast_nullable_to_non_nullable
              as PageState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationsPermissions: null == notificationsPermissions
          ? _value.notificationsPermissions
          : notificationsPermissions // ignore: cast_nullable_to_non_nullable
              as NotificationsPermissions,
    ));
  }
}

/// @nodoc

class _$_OnboardingState implements _OnboardingState {
  const _$_OnboardingState(
      {this.pageState = PageState.initial,
      this.message = '',
      this.notificationsEnabled = false,
      this.notificationsPermissions = NotificationsPermissions.initial});

  @override
  @JsonKey()
  final PageState pageState;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final bool notificationsEnabled;
  @override
  @JsonKey()
  final NotificationsPermissions notificationsPermissions;

  @override
  String toString() {
    return 'OnboardingState(pageState: $pageState, message: $message, notificationsEnabled: $notificationsEnabled, notificationsPermissions: $notificationsPermissions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnboardingState &&
            (identical(other.pageState, pageState) ||
                other.pageState == pageState) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(
                    other.notificationsPermissions, notificationsPermissions) ||
                other.notificationsPermissions == notificationsPermissions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageState, message,
      notificationsEnabled, notificationsPermissions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnboardingStateCopyWith<_$_OnboardingState> get copyWith =>
      __$$_OnboardingStateCopyWithImpl<_$_OnboardingState>(this, _$identity);
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState(
          {final PageState pageState,
          final String message,
          final bool notificationsEnabled,
          final NotificationsPermissions notificationsPermissions}) =
      _$_OnboardingState;

  @override
  PageState get pageState;
  @override
  String get message;
  @override
  bool get notificationsEnabled;
  @override
  NotificationsPermissions get notificationsPermissions;
  @override
  @JsonKey(ignore: true)
  _$$_OnboardingStateCopyWith<_$_OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}
