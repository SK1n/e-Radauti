// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordForm {
  EmailInput get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordFormCopyWith<ForgotPasswordForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordFormCopyWith<$Res> {
  factory $ForgotPasswordFormCopyWith(
          ForgotPasswordForm value, $Res Function(ForgotPasswordForm) then) =
      _$ForgotPasswordFormCopyWithImpl<$Res, ForgotPasswordForm>;
  @useResult
  $Res call({EmailInput email});
}

/// @nodoc
class _$ForgotPasswordFormCopyWithImpl<$Res, $Val extends ForgotPasswordForm>
    implements $ForgotPasswordFormCopyWith<$Res> {
  _$ForgotPasswordFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordFormCopyWith<$Res>
    implements $ForgotPasswordFormCopyWith<$Res> {
  factory _$$_ForgotPasswordFormCopyWith(_$_ForgotPasswordForm value,
          $Res Function(_$_ForgotPasswordForm) then) =
      __$$_ForgotPasswordFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EmailInput email});
}

/// @nodoc
class __$$_ForgotPasswordFormCopyWithImpl<$Res>
    extends _$ForgotPasswordFormCopyWithImpl<$Res, _$_ForgotPasswordForm>
    implements _$$_ForgotPasswordFormCopyWith<$Res> {
  __$$_ForgotPasswordFormCopyWithImpl(
      _$_ForgotPasswordForm _value, $Res Function(_$_ForgotPasswordForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_ForgotPasswordForm(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordForm extends _ForgotPasswordForm {
  const _$_ForgotPasswordForm({this.email = const EmailInput.pure()})
      : super._();

  @override
  @JsonKey()
  final EmailInput email;

  @override
  String toString() {
    return 'ForgotPasswordForm(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordForm &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordFormCopyWith<_$_ForgotPasswordForm> get copyWith =>
      __$$_ForgotPasswordFormCopyWithImpl<_$_ForgotPasswordForm>(
          this, _$identity);
}

abstract class _ForgotPasswordForm extends ForgotPasswordForm {
  const factory _ForgotPasswordForm({final EmailInput email}) =
      _$_ForgotPasswordForm;
  const _ForgotPasswordForm._() : super._();

  @override
  EmailInput get email;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordFormCopyWith<_$_ForgotPasswordForm> get copyWith =>
      throw _privateConstructorUsedError;
}
