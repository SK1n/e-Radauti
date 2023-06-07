// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpFormState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  AuthFailureOrSuccess get authFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpFormStateCopyWith<SignUpFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpFormStateCopyWith<$Res> {
  factory $SignUpFormStateCopyWith(
          SignUpFormState value, $Res Function(SignUpFormState) then) =
      _$SignUpFormStateCopyWithImpl<$Res, SignUpFormState>;
  @useResult
  $Res call(
      {String email,
      String password,
      String name,
      String phoneNumber,
      bool showErrorMessage,
      bool isSubmitting,
      AuthFailureOrSuccess authFailureOrSuccess});

  $AuthFailureOrSuccessCopyWith<$Res> get authFailureOrSuccess;
}

/// @nodoc
class _$SignUpFormStateCopyWithImpl<$Res, $Val extends SignUpFormState>
    implements $SignUpFormStateCopyWith<$Res> {
  _$SignUpFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? phoneNumber = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
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
    implements $SignUpFormStateCopyWith<$Res> {
  factory _$$_SignInFormStateCopyWith(
          _$_SignInFormState value, $Res Function(_$_SignInFormState) then) =
      __$$_SignInFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String name,
      String phoneNumber,
      bool showErrorMessage,
      bool isSubmitting,
      AuthFailureOrSuccess authFailureOrSuccess});

  @override
  $AuthFailureOrSuccessCopyWith<$Res> get authFailureOrSuccess;
}

/// @nodoc
class __$$_SignInFormStateCopyWithImpl<$Res>
    extends _$SignUpFormStateCopyWithImpl<$Res, _$_SignInFormState>
    implements _$$_SignInFormStateCopyWith<$Res> {
  __$$_SignInFormStateCopyWithImpl(
      _$_SignInFormState _value, $Res Function(_$_SignInFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? phoneNumber = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
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
      required this.name,
      required this.phoneNumber,
      required this.showErrorMessage,
      required this.isSubmitting,
      required this.authFailureOrSuccess});

  @override
  final String email;
  @override
  final String password;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final bool showErrorMessage;
  @override
  final bool isSubmitting;
  @override
  final AuthFailureOrSuccess authFailureOrSuccess;

  @override
  String toString() {
    return 'SignUpFormState(email: $email, password: $password, name: $name, phoneNumber: $phoneNumber, showErrorMessage: $showErrorMessage, isSubmitting: $isSubmitting, authFailureOrSuccess: $authFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInFormState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.showErrorMessage, showErrorMessage) ||
                other.showErrorMessage == showErrorMessage) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.authFailureOrSuccess, authFailureOrSuccess) ||
                other.authFailureOrSuccess == authFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, name,
      phoneNumber, showErrorMessage, isSubmitting, authFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInFormStateCopyWith<_$_SignInFormState> get copyWith =>
      __$$_SignInFormStateCopyWithImpl<_$_SignInFormState>(this, _$identity);
}

abstract class _SignInFormState implements SignUpFormState {
  factory _SignInFormState(
          {required final String email,
          required final String password,
          required final String name,
          required final String phoneNumber,
          required final bool showErrorMessage,
          required final bool isSubmitting,
          required final AuthFailureOrSuccess authFailureOrSuccess}) =
      _$_SignInFormState;

  @override
  String get email;
  @override
  String get password;
  @override
  String get name;
  @override
  String get phoneNumber;
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
mixin _$SignUpFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChange,
    required TResult Function(String name) nameChange,
    required TResult Function(String phoneNumber) phoneNumberChange,
    required TResult Function(String password) passwordChange,
    required TResult Function() createAccountWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChange,
    TResult? Function(String name)? nameChange,
    TResult? Function(String phoneNumber)? phoneNumberChange,
    TResult? Function(String password)? passwordChange,
    TResult? Function()? createAccountWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChange,
    TResult Function(String name)? nameChange,
    TResult Function(String phoneNumber)? phoneNumberChange,
    TResult Function(String password)? passwordChange,
    TResult Function()? createAccountWithEmailAndPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChange value) emailChange,
    required TResult Function(NameChange value) nameChange,
    required TResult Function(PhoneNumberChange value) phoneNumberChange,
    required TResult Function(PasswordChange value) passwordChange,
    required TResult Function(CreateAccountWithEmailAndPassword value)
        createAccountWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChange value)? emailChange,
    TResult? Function(NameChange value)? nameChange,
    TResult? Function(PhoneNumberChange value)? phoneNumberChange,
    TResult? Function(PasswordChange value)? passwordChange,
    TResult? Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChange value)? emailChange,
    TResult Function(NameChange value)? nameChange,
    TResult Function(PhoneNumberChange value)? phoneNumberChange,
    TResult Function(PasswordChange value)? passwordChange,
    TResult Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpFormEventCopyWith<$Res> {
  factory $SignUpFormEventCopyWith(
          SignUpFormEvent value, $Res Function(SignUpFormEvent) then) =
      _$SignUpFormEventCopyWithImpl<$Res, SignUpFormEvent>;
}

/// @nodoc
class _$SignUpFormEventCopyWithImpl<$Res, $Val extends SignUpFormEvent>
    implements $SignUpFormEventCopyWith<$Res> {
  _$SignUpFormEventCopyWithImpl(this._value, this._then);

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
    extends _$SignUpFormEventCopyWithImpl<$Res, _$EmailChange>
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
    return 'SignUpFormEvent.emailChange(email: $email)';
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
    required TResult Function(String name) nameChange,
    required TResult Function(String phoneNumber) phoneNumberChange,
    required TResult Function(String password) passwordChange,
    required TResult Function() createAccountWithEmailAndPassword,
  }) {
    return emailChange(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChange,
    TResult? Function(String name)? nameChange,
    TResult? Function(String phoneNumber)? phoneNumberChange,
    TResult? Function(String password)? passwordChange,
    TResult? Function()? createAccountWithEmailAndPassword,
  }) {
    return emailChange?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChange,
    TResult Function(String name)? nameChange,
    TResult Function(String phoneNumber)? phoneNumberChange,
    TResult Function(String password)? passwordChange,
    TResult Function()? createAccountWithEmailAndPassword,
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
    required TResult Function(NameChange value) nameChange,
    required TResult Function(PhoneNumberChange value) phoneNumberChange,
    required TResult Function(PasswordChange value) passwordChange,
    required TResult Function(CreateAccountWithEmailAndPassword value)
        createAccountWithEmailAndPassword,
  }) {
    return emailChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChange value)? emailChange,
    TResult? Function(NameChange value)? nameChange,
    TResult? Function(PhoneNumberChange value)? phoneNumberChange,
    TResult? Function(PasswordChange value)? passwordChange,
    TResult? Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
  }) {
    return emailChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChange value)? emailChange,
    TResult Function(NameChange value)? nameChange,
    TResult Function(PhoneNumberChange value)? phoneNumberChange,
    TResult Function(PasswordChange value)? passwordChange,
    TResult Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (emailChange != null) {
      return emailChange(this);
    }
    return orElse();
  }
}

abstract class EmailChange implements SignUpFormEvent {
  const factory EmailChange(final String email) = _$EmailChange;

  String get email;
  @JsonKey(ignore: true)
  _$$EmailChangeCopyWith<_$EmailChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NameChangeCopyWith<$Res> {
  factory _$$NameChangeCopyWith(
          _$NameChange value, $Res Function(_$NameChange) then) =
      __$$NameChangeCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$NameChangeCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res, _$NameChange>
    implements _$$NameChangeCopyWith<$Res> {
  __$$NameChangeCopyWithImpl(
      _$NameChange _value, $Res Function(_$NameChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$NameChange(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameChange implements NameChange {
  const _$NameChange(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'SignUpFormEvent.nameChange(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameChange &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NameChangeCopyWith<_$NameChange> get copyWith =>
      __$$NameChangeCopyWithImpl<_$NameChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChange,
    required TResult Function(String name) nameChange,
    required TResult Function(String phoneNumber) phoneNumberChange,
    required TResult Function(String password) passwordChange,
    required TResult Function() createAccountWithEmailAndPassword,
  }) {
    return nameChange(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChange,
    TResult? Function(String name)? nameChange,
    TResult? Function(String phoneNumber)? phoneNumberChange,
    TResult? Function(String password)? passwordChange,
    TResult? Function()? createAccountWithEmailAndPassword,
  }) {
    return nameChange?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChange,
    TResult Function(String name)? nameChange,
    TResult Function(String phoneNumber)? phoneNumberChange,
    TResult Function(String password)? passwordChange,
    TResult Function()? createAccountWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (nameChange != null) {
      return nameChange(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChange value) emailChange,
    required TResult Function(NameChange value) nameChange,
    required TResult Function(PhoneNumberChange value) phoneNumberChange,
    required TResult Function(PasswordChange value) passwordChange,
    required TResult Function(CreateAccountWithEmailAndPassword value)
        createAccountWithEmailAndPassword,
  }) {
    return nameChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChange value)? emailChange,
    TResult? Function(NameChange value)? nameChange,
    TResult? Function(PhoneNumberChange value)? phoneNumberChange,
    TResult? Function(PasswordChange value)? passwordChange,
    TResult? Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
  }) {
    return nameChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChange value)? emailChange,
    TResult Function(NameChange value)? nameChange,
    TResult Function(PhoneNumberChange value)? phoneNumberChange,
    TResult Function(PasswordChange value)? passwordChange,
    TResult Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (nameChange != null) {
      return nameChange(this);
    }
    return orElse();
  }
}

abstract class NameChange implements SignUpFormEvent {
  const factory NameChange(final String name) = _$NameChange;

  String get name;
  @JsonKey(ignore: true)
  _$$NameChangeCopyWith<_$NameChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneNumberChangeCopyWith<$Res> {
  factory _$$PhoneNumberChangeCopyWith(
          _$PhoneNumberChange value, $Res Function(_$PhoneNumberChange) then) =
      __$$PhoneNumberChangeCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$PhoneNumberChangeCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res, _$PhoneNumberChange>
    implements _$$PhoneNumberChangeCopyWith<$Res> {
  __$$PhoneNumberChangeCopyWithImpl(
      _$PhoneNumberChange _value, $Res Function(_$PhoneNumberChange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$PhoneNumberChange(
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneNumberChange implements PhoneNumberChange {
  const _$PhoneNumberChange(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SignUpFormEvent.phoneNumberChange(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberChange &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberChangeCopyWith<_$PhoneNumberChange> get copyWith =>
      __$$PhoneNumberChangeCopyWithImpl<_$PhoneNumberChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChange,
    required TResult Function(String name) nameChange,
    required TResult Function(String phoneNumber) phoneNumberChange,
    required TResult Function(String password) passwordChange,
    required TResult Function() createAccountWithEmailAndPassword,
  }) {
    return phoneNumberChange(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChange,
    TResult? Function(String name)? nameChange,
    TResult? Function(String phoneNumber)? phoneNumberChange,
    TResult? Function(String password)? passwordChange,
    TResult? Function()? createAccountWithEmailAndPassword,
  }) {
    return phoneNumberChange?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChange,
    TResult Function(String name)? nameChange,
    TResult Function(String phoneNumber)? phoneNumberChange,
    TResult Function(String password)? passwordChange,
    TResult Function()? createAccountWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (phoneNumberChange != null) {
      return phoneNumberChange(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChange value) emailChange,
    required TResult Function(NameChange value) nameChange,
    required TResult Function(PhoneNumberChange value) phoneNumberChange,
    required TResult Function(PasswordChange value) passwordChange,
    required TResult Function(CreateAccountWithEmailAndPassword value)
        createAccountWithEmailAndPassword,
  }) {
    return phoneNumberChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChange value)? emailChange,
    TResult? Function(NameChange value)? nameChange,
    TResult? Function(PhoneNumberChange value)? phoneNumberChange,
    TResult? Function(PasswordChange value)? passwordChange,
    TResult? Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
  }) {
    return phoneNumberChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChange value)? emailChange,
    TResult Function(NameChange value)? nameChange,
    TResult Function(PhoneNumberChange value)? phoneNumberChange,
    TResult Function(PasswordChange value)? passwordChange,
    TResult Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (phoneNumberChange != null) {
      return phoneNumberChange(this);
    }
    return orElse();
  }
}

abstract class PhoneNumberChange implements SignUpFormEvent {
  const factory PhoneNumberChange(final String phoneNumber) =
      _$PhoneNumberChange;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$PhoneNumberChangeCopyWith<_$PhoneNumberChange> get copyWith =>
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
    extends _$SignUpFormEventCopyWithImpl<$Res, _$PasswordChange>
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
    return 'SignUpFormEvent.passwordChange(password: $password)';
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
    required TResult Function(String name) nameChange,
    required TResult Function(String phoneNumber) phoneNumberChange,
    required TResult Function(String password) passwordChange,
    required TResult Function() createAccountWithEmailAndPassword,
  }) {
    return passwordChange(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChange,
    TResult? Function(String name)? nameChange,
    TResult? Function(String phoneNumber)? phoneNumberChange,
    TResult? Function(String password)? passwordChange,
    TResult? Function()? createAccountWithEmailAndPassword,
  }) {
    return passwordChange?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChange,
    TResult Function(String name)? nameChange,
    TResult Function(String phoneNumber)? phoneNumberChange,
    TResult Function(String password)? passwordChange,
    TResult Function()? createAccountWithEmailAndPassword,
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
    required TResult Function(NameChange value) nameChange,
    required TResult Function(PhoneNumberChange value) phoneNumberChange,
    required TResult Function(PasswordChange value) passwordChange,
    required TResult Function(CreateAccountWithEmailAndPassword value)
        createAccountWithEmailAndPassword,
  }) {
    return passwordChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChange value)? emailChange,
    TResult? Function(NameChange value)? nameChange,
    TResult? Function(PhoneNumberChange value)? phoneNumberChange,
    TResult? Function(PasswordChange value)? passwordChange,
    TResult? Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
  }) {
    return passwordChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChange value)? emailChange,
    TResult Function(NameChange value)? nameChange,
    TResult Function(PhoneNumberChange value)? phoneNumberChange,
    TResult Function(PasswordChange value)? passwordChange,
    TResult Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (passwordChange != null) {
      return passwordChange(this);
    }
    return orElse();
  }
}

abstract class PasswordChange implements SignUpFormEvent {
  const factory PasswordChange(final String password) = _$PasswordChange;

  String get password;
  @JsonKey(ignore: true)
  _$$PasswordChangeCopyWith<_$PasswordChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateAccountWithEmailAndPasswordCopyWith<$Res> {
  factory _$$CreateAccountWithEmailAndPasswordCopyWith(
          _$CreateAccountWithEmailAndPassword value,
          $Res Function(_$CreateAccountWithEmailAndPassword) then) =
      __$$CreateAccountWithEmailAndPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateAccountWithEmailAndPasswordCopyWithImpl<$Res>
    extends _$SignUpFormEventCopyWithImpl<$Res,
        _$CreateAccountWithEmailAndPassword>
    implements _$$CreateAccountWithEmailAndPasswordCopyWith<$Res> {
  __$$CreateAccountWithEmailAndPasswordCopyWithImpl(
      _$CreateAccountWithEmailAndPassword _value,
      $Res Function(_$CreateAccountWithEmailAndPassword) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateAccountWithEmailAndPassword
    implements CreateAccountWithEmailAndPassword {
  const _$CreateAccountWithEmailAndPassword();

  @override
  String toString() {
    return 'SignUpFormEvent.createAccountWithEmailAndPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAccountWithEmailAndPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChange,
    required TResult Function(String name) nameChange,
    required TResult Function(String phoneNumber) phoneNumberChange,
    required TResult Function(String password) passwordChange,
    required TResult Function() createAccountWithEmailAndPassword,
  }) {
    return createAccountWithEmailAndPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChange,
    TResult? Function(String name)? nameChange,
    TResult? Function(String phoneNumber)? phoneNumberChange,
    TResult? Function(String password)? passwordChange,
    TResult? Function()? createAccountWithEmailAndPassword,
  }) {
    return createAccountWithEmailAndPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChange,
    TResult Function(String name)? nameChange,
    TResult Function(String phoneNumber)? phoneNumberChange,
    TResult Function(String password)? passwordChange,
    TResult Function()? createAccountWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (createAccountWithEmailAndPassword != null) {
      return createAccountWithEmailAndPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChange value) emailChange,
    required TResult Function(NameChange value) nameChange,
    required TResult Function(PhoneNumberChange value) phoneNumberChange,
    required TResult Function(PasswordChange value) passwordChange,
    required TResult Function(CreateAccountWithEmailAndPassword value)
        createAccountWithEmailAndPassword,
  }) {
    return createAccountWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChange value)? emailChange,
    TResult? Function(NameChange value)? nameChange,
    TResult? Function(PhoneNumberChange value)? phoneNumberChange,
    TResult? Function(PasswordChange value)? passwordChange,
    TResult? Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
  }) {
    return createAccountWithEmailAndPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChange value)? emailChange,
    TResult Function(NameChange value)? nameChange,
    TResult Function(PhoneNumberChange value)? phoneNumberChange,
    TResult Function(PasswordChange value)? passwordChange,
    TResult Function(CreateAccountWithEmailAndPassword value)?
        createAccountWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (createAccountWithEmailAndPassword != null) {
      return createAccountWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class CreateAccountWithEmailAndPassword implements SignUpFormEvent {
  const factory CreateAccountWithEmailAndPassword() =
      _$CreateAccountWithEmailAndPassword;
}
