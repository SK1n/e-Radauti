import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
import 'package:flutterapperadauti/app/form_inputs/sign_up_form.dart';
import 'package:flutterapperadauti/app/repository/authentication/authentication_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        form: state.form.copyWith(email: email),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);
    emit(
      state.copyWith(
        form: state.form.copyWith(password: password),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void usernameChanged(String value) {
    final username = NameInput.dirty(value);
    emit(
      state.copyWith(
        form: state.form.copyWith(name: username),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneInput.dirty(value);
    emit(
      state.copyWith(
        form: state.form.copyWith(phone: phoneNumber),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmPasswordInput.dirty(
      password: state.form.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        form: state.form.copyWith(confirmPassword: confirmedPassword),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> createAccountWithEmailAndPassword() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.signUp(
        email: state.form.email.value,
        password: state.form.password.value,
        username: state.form.name.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
