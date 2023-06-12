import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:storage_repository/storage_repository.dart';

part 'report_problem_state.dart';

class ReportProblemCubit extends Cubit<ReportProblemState> {
  ReportProblemCubit() : super(const ReportProblemState());

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        username: username,
        formzStatus: FormzSubmissionStatus.initial,
        errorMessage: null,
        isValid: Formz.validate([state.username, username]),
      ),
    );
  }

  void categoryChanged(String? value) {
    final category = Dropdown.dirty(value ?? "");
    emit(
      state.copyWith(
        category: category,
        formzStatus: FormzSubmissionStatus.initial,
        errorMessage: null,
        isValid: Formz.validate([state.category, category]),
      ),
    );
  }

  void institutionChanged(String? value) {
    final institution = Dropdown.dirty(value ?? "");
    emit(
      state.copyWith(
        institution: institution,
        formzStatus: FormzSubmissionStatus.initial,
        errorMessage: null,
        isValid: Formz.validate([state.institution, institution]),
      ),
    );
  }

  void subjectChanged(String value) {
    final subject = Subject.dirty(value);
    emit(
      state.copyWith(
        subject: subject,
        formzStatus: FormzSubmissionStatus.initial,
        errorMessage: null,
        isValid: Formz.validate([state.subject, subject]),
      ),
    );
  }

  void descriptionChanged(String value) {
    final description = Description.dirty(value);
    emit(
      state.copyWith(
        description: description,
        formzStatus: FormzSubmissionStatus.initial,
        errorMessage: null,
        isValid: Formz.validate([state.description, description]),
      ),
    );
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        formzStatus: FormzSubmissionStatus.initial,
        errorMessage: null,
        isValid: Formz.validate([state.phoneNumber, phoneNumber]),
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        formzStatus: FormzSubmissionStatus.initial,
        errorMessage: null,
        isValid: Formz.validate([state.email, email]),
      ),
    );
  }

  void imagePickerChanged(String value) {
    final imagePicker = ImagePicker.dirty(value);
    emit(
      state.copyWith(
        imagePicker: imagePicker,
        formzStatus: FormzSubmissionStatus.initial,
        errorMessage: null,
        isValid: Formz.validate([state.imagePicker, imagePicker]),
      ),
    );
  }
}
