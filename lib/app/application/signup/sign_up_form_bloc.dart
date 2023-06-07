import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/domain/auth/i_auth_firebase.dart';
import 'package:flutterapperadauti/app/infrastructure/auth/auth_failure_or_success.dart';
import 'package:flutterapperadauti/modules/create_account/views/create_account_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_form_state.dart';

part 'sign_up_form_event.dart';

part 'sign_up_form_bloc.freezed.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthFirebase _iAuthFirebase;
  SignUpFormBloc(this._iAuthFirebase) : super(SignUpFormState.initial()) {
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
    on<CreateAccountWithEmailAndPassword>(
      (event, emit) async {
        final String email = state.email;
        final String password = state.password;
        final String username = state.name;
        final String phoneNumber = state.phoneNumber;
        emit(
          state.copyWith(
            showErrorMessage: false,
            isSubmitting: true,
            authFailureOrSuccess: const AuthFailureOrSuccess.none(),
          ),
        );

        var result = await _iAuthFirebase.createUserWithEmailAndPassword(
          email: email,
          password: password,
          username: username,
          phoneNumber: phoneNumber,
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
