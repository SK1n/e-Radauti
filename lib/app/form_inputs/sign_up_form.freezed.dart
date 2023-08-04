// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpForm {
  EmailInput get email => throw _privateConstructorUsedError;
  NameInput get name => throw _privateConstructorUsedError;
  PhoneInput get phone => throw _privateConstructorUsedError;
  PasswordInput get password => throw _privateConstructorUsedError;
  ConfirmPasswordInput get confirmPassword =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpFormCopyWith<SignUpForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpFormCopyWith<$Res> {
  factory $SignUpFormCopyWith(
          SignUpForm value, $Res Function(SignUpForm) then) =
      _$SignUpFormCopyWithImpl<$Res, SignUpForm>;
  @useResult
  $Res call(
      {EmailInput email,
      NameInput name,
      PhoneInput phone,
      PasswordInput password,
      ConfirmPasswordInput confirmPassword});
}

/// @nodoc
class _$SignUpFormCopyWithImpl<$Res, $Val extends SignUpForm>
    implements $SignUpFormCopyWith<$Res> {
  _$SignUpFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? phone = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as NameInput,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as PhoneInput,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPasswordInput,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpFormCopyWith<$Res>
    implements $SignUpFormCopyWith<$Res> {
  factory _$$_SignUpFormCopyWith(
          _$_SignUpForm value, $Res Function(_$_SignUpForm) then) =
      __$$_SignUpFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailInput email,
      NameInput name,
      PhoneInput phone,
      PasswordInput password,
      ConfirmPasswordInput confirmPassword});
}

/// @nodoc
class __$$_SignUpFormCopyWithImpl<$Res>
    extends _$SignUpFormCopyWithImpl<$Res, _$_SignUpForm>
    implements _$$_SignUpFormCopyWith<$Res> {
  __$$_SignUpFormCopyWithImpl(
      _$_SignUpForm _value, $Res Function(_$_SignUpForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? phone = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$_SignUpForm(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as NameInput,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as PhoneInput,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPasswordInput,
    ));
  }
}

/// @nodoc

class _$_SignUpForm extends _SignUpForm {
  const _$_SignUpForm(
      {this.email = const EmailInput.pure(),
      this.name = const NameInput.pure(),
      this.phone = const PhoneInput.pure(),
      this.password = const PasswordInput.pure(),
      this.confirmPassword = const ConfirmPasswordInput.pure()})
      : super._();

  @override
  @JsonKey()
  final EmailInput email;
  @override
  @JsonKey()
  final NameInput name;
  @override
  @JsonKey()
  final PhoneInput phone;
  @override
  @JsonKey()
  final PasswordInput password;
  @override
  @JsonKey()
  final ConfirmPasswordInput confirmPassword;

  @override
  String toString() {
    return 'SignUpForm(email: $email, name: $name, phone: $phone, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpForm &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, name, phone, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpFormCopyWith<_$_SignUpForm> get copyWith =>
      __$$_SignUpFormCopyWithImpl<_$_SignUpForm>(this, _$identity);
}

abstract class _SignUpForm extends SignUpForm {
  const factory _SignUpForm(
      {final EmailInput email,
      final NameInput name,
      final PhoneInput phone,
      final PasswordInput password,
      final ConfirmPasswordInput confirmPassword}) = _$_SignUpForm;
  const _SignUpForm._() : super._();

  @override
  EmailInput get email;
  @override
  NameInput get name;
  @override
  PhoneInput get phone;
  @override
  PasswordInput get password;
  @override
  ConfirmPasswordInput get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpFormCopyWith<_$_SignUpForm> get copyWith =>
      throw _privateConstructorUsedError;
}
