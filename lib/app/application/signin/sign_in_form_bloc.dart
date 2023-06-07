import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/domain/auth/i_auth_firebase.dart';
import 'package:flutterapperadauti/app/infrastructure/auth/auth_failure_or_success.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFirebase _iAuthFirebase;
  SignInFormBloc(this._iAuthFirebase) : super(SignInFormState.initial()) {
    on<EmailChange>(
      (event, emit) => emit(
        state.copyWith(
          email: event.email,
        ),
      ),
    );
    on<PasswordChange>(
      (event, emit) => emit(
        state.copyWith(
          password: event.password,
        ),
      ),
    );
    on<RememberMeChange>(
      (event, emit) => emit(
        state.copyWith(
          rememberMe: event.rememberMe,
        ),
      ),
    );
    on<SignInWithEmailAndPassword>(
      (event, emit) async {
        final String email = state.email;
        final String password = state.password;
        emit(
          state.copyWith(
            showErrorMessage: false,
            isSubmitting: true,
            authFailureOrSuccess: const AuthFailureOrSuccess.none(),
          ),
        );

        var result = await _iAuthFirebase.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        emit(
          state.copyWith(
            isSubmitting: false,
            authFailureOrSuccess: result.authFailureOrSuccess,
          ),
        );
      },
    );
  }
}
