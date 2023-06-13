import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/cubit/location_cubit.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'report_problem_state.dart';
part 'report_problem_cubit.freezed.dart';

class ReportProblemCubit extends Cubit<ReportProblemState> {
  final LocationCubit locationCubit;
  ReportProblemCubit({required this.locationCubit})
      : super(ReportProblemState.initial());

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    final isValid = Formz.validate([
      state.username,
      username,
    ]);

    emit(
      state.copyWith(
        username: username,
        formzStatus: FormzSubmissionStatus.initial,
        isValid: isValid,
      ),
    );
  }

  void subjectChanged(String value) {
    final subject = Subject.dirty(value);
    final isValid = Formz.validate([
      state.subject,
      subject,
    ]);

    emit(
      state.copyWith(
        subject: subject,
        formzStatus: FormzSubmissionStatus.initial,
        isValid: isValid,
      ),
    );
  }

  void descriptionChanged(String value) {
    final description = Description.dirty(value);
    final isValid = Formz.validate([
      state.description,
      description,
    ]);

    emit(
      state.copyWith(
        description: description,
        formzStatus: FormzSubmissionStatus.initial,
        isValid: isValid,
      ),
    );
  }

  void institutionChanged(String value) {
    final institution = Institution.dirty(value);
    final isValid = Formz.validate([
      state.institution,
      institution,
    ]);

    emit(
      state.copyWith(
        institution: institution,
        formzStatus: FormzSubmissionStatus.initial,
        isValid: isValid,
      ),
    );
  }

  void categoryChanged(String value) {
    final category = Category.dirty(value);
    final isValid = Formz.validate([
      state.category,
      category,
    ]);

    emit(
      state.copyWith(
        category: category,
        formzStatus: FormzSubmissionStatus.initial,
        isValid: isValid,
      ),
    );
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    final isValid = Formz.validate([
      state.phoneNumber,
      phoneNumber,
    ]);

    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        formzStatus: FormzSubmissionStatus.initial,
        isValid: isValid,
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    final isValid = Formz.validate([
      state.email,
      email,
    ]);

    emit(
      state.copyWith(
        email: email,
        formzStatus: FormzSubmissionStatus.initial,
        isValid: isValid,
      ),
    );
  }

  void imagePickerChanged(List<dynamic>? value) {
    final imagePicker = ImagePicker.dirty(value);
    final isValid = Formz.validate([
      state.imagePicker,
      imagePicker,
    ]);

    emit(
      state.copyWith(
        imagePicker: imagePicker,
        formzStatus: FormzSubmissionStatus.initial,
        isValid: isValid,
      ),
    );
  }

  void locationChanged(bool value) async {
    try {
      final locationEnabled = GenericInput<bool>.dirty(value);
      if (value) {
        Position position = await _determinePosition();
        emit(
          state.copyWith(
            position: position,
            locationEnabled: locationEnabled,
            formzStatus: FormzSubmissionStatus.initial,
            isValid: Formz.validate([
              state.locationEnabled,
              locationEnabled,
            ]),
          ),
        );
      }
    } catch (_) {
      const locationEnabled = GenericInput<bool>.dirty(false);
      Future.delayed(const Duration(seconds: 2));
      emit(
        state.copyWith(
          locationEnabled: locationEnabled,
          position: null,
          formzStatus: FormzSubmissionStatus.failure,
          isValid: Formz.validate([
            state.locationEnabled,
            locationEnabled,
          ]),
        ),
      );
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
