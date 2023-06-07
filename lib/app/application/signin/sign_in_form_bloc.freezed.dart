// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInFormState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get rememberMe => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  AuthFailureOrSuccess get authFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInFormStateCopyWith<SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res, SignInFormState>;
  @useResult
  $Res call(
      {String email,
      String password,
      bool rememberMe,
      bool showErrorMessage,
      bool isSubmitting,
      AuthFailureOrSuccess authFailureOrSuccess});

  $AuthFailureOrSuccessCopyWith<$Res> get authFailureOrSuccess;
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res, $Val extends SignInFormState>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? rememberMe = null,
    Object? showErrorMessage = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccess: null == authFailureOrSuccess
          ? _value.authFailureOrSuccess
          : authFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as AuthFailureOrSuccess,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthFailureOrSuccessCopyWith<$Res> get authFailureOrSuccess {
    return $AuthFailureOrSuccessCopyWith<$Res>(_value.authFailureOrSuccess,
        (value) {
      return _then(_value.copyWith(authFailureOrSuccess: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SignInFormStateCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$$_SignInFormStateCopyWith(
          _$_SignInFormState value, $Res Function(_$_SignInFormState) then) =
      __$$_SignInFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      bool rememberMe,
      bool showErrorMessage,
      bool isSubmitting,
      AuthFailureOrSuccess authFailureOrSuccess});

  @override
  $AuthFailureOrSuccessCopyWith<$Res> get authFailureOrSuccess;
}

/// @nodoc
class __$$_SignInFormStateCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res, _$_SignInFormState>
    implements _$$_SignInFormStateCopyWith<$Res> {
  __$$_SignInFormStateCopyWithImpl(
      _$_SignInFormState _value, $Res Function(_$_SignInFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? rememberMe = null,
    Object? showErrorMessage = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccess = null,
  }) {
    return _then(_$_SignInFormState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccess: null == authFailureOrSuccess
          ? _value.authFailureOrSuccess
          : authFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as AuthFailureOrSuccess,
    ));
  }
}

/// @nodoc

class _$_SignInFormState implements _SignInFormState {
  _$_SignInFormState(
      {required this.email,
      required this.password,
      required this.rememberMe,
      required this.showErrorMessage,
      required this.isSubmitting,
      required this.authFailureOrSuccess});

  @override
  final String email;
  @override
  final String password;
  @override
  final bool rememberMe;
  @override
  final bool showErrorMessage;
  @override
  final bool isSubmitting;
  @override
  final AuthFailureOrSuccess authFailureOrSuccess;

  @override
  String toString() {
    return 'SignInFormState(email: $email, password: $password, rememberMe: $rememberMe, showErrorMessage: $showErrorMessage, isSubmitting: $isSubmitting, authFailureOrSuccess: $authFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInFormState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe) &&
            (identical(other.showErrorMessage, showErrorMessage) ||
                other.showErrorMessage == showErrorMessage) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.authFailureOrSuccess, authFailureOrSuccess) ||
                other.authFailureOrSuccess == authFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, rememberMe,
      showErrorMessage, isSubmitting, authFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInFormStateCopyWith<_$_SignInFormState> get copyWith =>
      __$$_SignInFormStateCopyWithImpl<_$_SignInFormState>(this, _$identity);
}

abstract class _SignInFormState implements SignInFormState {
  factory _SignInFormState(
          {required final String email,
          required final String password,
          required final bool rememberMe,
          required final bool showErrorMessage,
          required final bool isSubmitting,
          required final AuthFailureOrSuccess authFailureOrSuccess}) =
      _$_SignInFormState;

  @override
  String get email;
  @override
  String get password;
  @override
  bool get rememberMe;
  @override
  bool get showErrorMessage;
  @override
  bool get isSubmitting;
  @override
  AuthFailureOrSuccess get authFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_SignInFormStateCopyWith<_$_SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignInFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChange,
    required TResult Function(String password) passwordChange,
    required TResult Function(bool rememberMe) rememberMeChange,
    required TResult Function() signInWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChange,
    TResult? Function(String password)? passwordChange,
    TResult? Function(bool rememberMe)? rememberMeChange,
    TResult? Function()? signInWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChange,
    TResult Function(String password)? passwordChange,
    TResult Function(bool rememberMe)? rememberMeChange,
    TResult Function()? signInWithEmailAndPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChange value) emailChange,
    required TResult Function(PasswordChange value) passwordChange,
    required TResult Function(RememberMeChange value) rememberMeChange,
    required TResult Function(SignInWithEmailAndPassword value)
        signInWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChange value)? emailChange,
    TResult? Function(PasswordChange value)? passwordChange,
    TResult? Function(RememberMeChange value)? rememberMeChange,
    TResult? Function(SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChange value)? emailChange,
    TResult Function(PasswordChange value)? passwordChange,
    TResult Function(RememberMeChange value)? rememberMeChange,
    TResult Function(SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormEventCopyWith<$Res> {
  factory $SignInFormEventCopyWith(
          SignInFormEvent value, $Res Function(SignInFormEvent) then) =
      _$SignInFormEventCopyWithImpl<$Res, SignInFormEvent>;
}

/// @nodoc
class _$SignInFormEventCopyWithImpl<$Res, $Val extends SignInFormEvent>
    implements $SignInFormEventCopyWith<$Res> {
  _$SignInFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmailChangeCopyWith<$Res> {
  factory _$$EmailChangeCopyWith(
          _$EmailChange value, $Res Function(_$EmailChange) then) =
      __$$EmailChangeCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailChangeCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$EmailChange>
    implements _$$EmailChangeCopyWith<$Res> {
  __$$EmailChangeCopyWithImpl(
      _$EmailChange _value, $Res Function(_$EmailChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailChange(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChange implements EmailChange {
  const _$EmailChange(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignInFormEvent.emailChange(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailChange &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailChangeCopyWith<_$EmailChange> get copyWith =>
      __$$EmailChangeCopyWithImpl<_$EmailChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChange,
    required TResult Function(String password) passwordChange,
    required TResult Function(bool rememberMe) rememberMeChange,
    required TResult Function() signInWithEmailAndPassword,
  }) {
    return emailChange(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChange,
    TResult? Function(String password)? passwordChange,
    TResult? Function(bool rememberMe)? rememberMeChange,
    TResult? Function()? signInWithEmailAndPassword,
  }) {
    return emailChange?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChange,
    TResult Function(String password)? passwordChange,
    TResult Function(bool rememberMe)? rememberMeChange,
    TResult Function()? signInWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (emailChange != null) {
      return emailChange(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChange value) emailChange,
    required TResult Function(PasswordChange value) passwordChange,
    required TResult Function(RememberMeChange value) rememberMeChange,
    required TResult Function(SignInWithEmailAndPassword value)
        signInWithEmailAndPassword,
  }) {
    return emailChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChange value)? emailChange,
    TResult? Function(PasswordChange value)? passwordChange,
    TResult? Function(RememberMeChange value)? rememberMeChange,
    TResult? Function(SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
  }) {
    return emailChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChange value)? emailChange,
    TResult Function(PasswordChange value)? passwordChange,
    TResult Function(RememberMeChange value)? rememberMeChange,
    TResult Function(SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (emailChange != null) {
      return emailChange(this);
    }
    return orElse();
  }
}

abstract class EmailChange implements SignInFormEvent {
  const factory EmailChange(final String email) = _$EmailChange;

  String get email;
  @JsonKey(ignore: true)
  _$$EmailChangeCopyWith<_$EmailChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordChangeCopyWith<$Res> {
  factory _$$PasswordChangeCopyWith(
          _$PasswordChange value, $Res Function(_$PasswordChange) then) =
      __$$PasswordChangeCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$PasswordChangeCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$PasswordChange>
    implements _$$PasswordChangeCopyWith<$Res> {
  __$$PasswordChangeCopyWithImpl(
      _$PasswordChange _value, $Res Function(_$PasswordChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$PasswordChange(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChange implements PasswordChange {
  const _$PasswordChange(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SignInFormEvent.passwordChange(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChange &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangeCopyWith<_$PasswordChange> get copyWith =>
      __$$PasswordChangeCopyWithImpl<_$PasswordChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChange,
    required TResult Function(String password) passwordChange,
    required TResult Function(bool rememberMe) rememberMeChange,
    required TResult Function() signInWithEmailAndPassword,
  }) {
    return passwordChange(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChange,
    TResult? Function(String password)? passwordChange,
    TResult? Function(bool rememberMe)? rememberMeChange,
    TResult? Function()? signInWithEmailAndPassword,
  }) {
    return passwordChange?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChange,
    TResult Function(String password)? passwordChange,
    TResult Function(bool rememberMe)? rememberMeChange,
    TResult Function()? signInWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (passwordChange != null) {
      return passwordChange(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChange value) emailChange,
    required TResult Function(PasswordChange value) passwordChange,
    required TResult Function(RememberMeChange value) rememberMeChange,
    required TResult Function(SignInWithEmailAndPassword value)
        signInWithEmailAndPassword,
  }) {
    return passwordChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChange value)? emailChange,
    TResult? Function(PasswordChange value)? passwordChange,
    TResult? Function(RememberMeChange value)? rememberMeChange,
    TResult? Function(SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
  }) {
    return passwordChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChange value)? emailChange,
    TResult Function(PasswordChange value)? passwordChange,
    TResult Function(RememberMeChange value)? rememberMeChange,
    TResult Function(SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (passwordChange != null) {
      return passwordChange(this);
    }
    return orElse();
  }
}

abstract class PasswordChange implements SignInFormEvent {
  const factory PasswordChange(final String password) = _$PasswordChange;

  String get password;
  @JsonKey(ignore: true)
  _$$PasswordChangeCopyWith<_$PasswordChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RememberMeChangeCopyWith<$Res> {
  factory _$$RememberMeChangeCopyWith(
          _$RememberMeChange value, $Res Function(_$RememberMeChange) then) =
      __$$RememberMeChangeCopyWithImpl<$Res>;
  @useResult
  $Res call({bool rememberMe});
}

/// @nodoc
class __$$RememberMeChangeCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$RememberMeChange>
    implements _$$RememberMeChangeCopyWith<$Res> {
  __$$RememberMeChangeCopyWithImpl(
      _$RememberMeChange _value, $Res Function(_$RememberMeChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rememberMe = null,
  }) {
    return _then(_$RememberMeChange(
      null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RememberMeChange implements RememberMeChange {
  const _$RememberMeChange(this.rememberMe);

  @override
  final bool rememberMe;

  @override
  String toString() {
    return 'SignInFormEvent.rememberMeChange(rememberMe: $rememberMe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RememberMeChange &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rememberMe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RememberMeChangeCopyWith<_$RememberMeChange> get copyWith =>
      __$$RememberMeChangeCopyWithImpl<_$RememberMeChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChange,
    required TResult Function(String password) passwordChange,
    required TResult Function(bool rememberMe) rememberMeChange,
    required TResult Function() signInWithEmailAndPassword,
  }) {
    return rememberMeChange(rememberMe);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChange,
    TResult? Function(String password)? passwordChange,
    TResult? Function(bool rememberMe)? rememberMeChange,
    TResult? Function()? signInWithEmailAndPassword,
  }) {
    return rememberMeChange?.call(rememberMe);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChange,
    TResult Function(String password)? passwordChange,
    TResult Function(bool rememberMe)? rememberMeChange,
    TResult Function()? signInWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (rememberMeChange != null) {
      return rememberMeChange(rememberMe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChange value) emailChange,
    required TResult Function(PasswordChange value) passwordChange,
    required TResult Function(RememberMeChange value) rememberMeChange,
    required TResult Function(SignInWithEmailAndPassword value)
        signInWithEmailAndPassword,
  }) {
    return rememberMeChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChange value)? emailChange,
    TResult? Function(PasswordChange value)? passwordChange,
    TResult? Function(RememberMeChange value)? rememberMeChange,
    TResult? Function(SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
  }) {
    return rememberMeChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChange value)? emailChange,
    TResult Function(PasswordChange value)? passwordChange,
    TResult Function(RememberMeChange value)? rememberMeChange,
    TResult Function(SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (rememberMeChange != null) {
      return rememberMeChange(this);
    }
    return orElse();
  }
}

abstract class RememberMeChange implements SignInFormEvent {
  const factory RememberMeChange(final bool rememberMe) = _$RememberMeChange;

  bool get rememberMe;
  @JsonKey(ignore: true)
  _$$RememberMeChangeCopyWith<_$RememberMeChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInWithEmailAndPasswordCopyWith<$Res> {
  factory _$$SignInWithEmailAndPasswordCopyWith(
          _$SignInWithEmailAndPassword value,
          $Res Function(_$SignInWithEmailAndPassword) then) =
      __$$SignInWithEmailAndPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithEmailAndPasswordCopyWithImpl<$Res>
    extends _$SignInFormEventCopyWithImpl<$Res, _$SignInWithEmailAndPassword>
    implements _$$SignInWithEmailAndPasswordCopyWith<$Res> {
  __$$SignInWithEmailAndPasswordCopyWithImpl(
      _$SignInWithEmailAndPassword _value,
      $Res Function(_$SignInWithEmailAndPassword) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInWithEmailAndPassword implements SignInWithEmailAndPassword {
  const _$SignInWithEmailAndPassword();

  @override
  String toString() {
    return 'SignInFormEvent.signInWithEmailAndPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithEmailAndPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChange,
    required TResult Function(String password) passwordChange,
    required TResult Function(bool rememberMe) rememberMeChange,
    required TResult Function() signInWithEmailAndPassword,
  }) {
    return signInWithEmailAndPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChange,
    TResult? Function(String password)? passwordChange,
    TResult? Function(bool rememberMe)? rememberMeChange,
    TResult? Function()? signInWithEmailAndPassword,
  }) {
    return signInWithEmailAndPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChange,
    TResult Function(String password)? passwordChange,
    TResult Function(bool rememberMe)? rememberMeChange,
    TResult Function()? signInWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPassword != null) {
      return signInWithEmailAndPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChange value) emailChange,
    required TResult Function(PasswordChange value) passwordChange,
    required TResult Function(RememberMeChange value) rememberMeChange,
    required TResult Function(SignInWithEmailAndPassword value)
        signInWithEmailAndPassword,
  }) {
    return signInWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChange value)? emailChange,
    TResult? Function(PasswordChange value)? passwordChange,
    TResult? Function(RememberMeChange value)? rememberMeChange,
    TResult? Function(SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
  }) {
    return signInWithEmailAndPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChange value)? emailChange,
    TResult Function(PasswordChange value)? passwordChange,
    TResult Function(RememberMeChange value)? rememberMeChange,
    TResult Function(SignInWithEmailAndPassword value)?
        signInWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPassword != null) {
      return signInWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class SignInWithEmailAndPassword implements SignInFormEvent {
  const factory SignInWithEmailAndPassword() = _$SignInWithEmailAndPassword;
}
