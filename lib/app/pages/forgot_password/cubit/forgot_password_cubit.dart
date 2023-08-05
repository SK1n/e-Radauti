import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/form_inputs/forgot_password_form.dart';
import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../repository/authentication/authentication_repository.dart';
import 'package:formz/formz.dart';

part 'forgot_password_cubit.freezed.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._authenticationRepository)
      : super(const ForgotPasswordState());

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

  void sendPasswordResetEmail() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.sendPasswordResetEmail(
        email: state.form.email.value,
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
