import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutterapperadauti/app/form_inputs/report_problem_form.dart';
import 'package:flutterapperadauti/app/models/report_problem/report_problem_item_model.dart';
import 'package:flutterapperadauti/app/models/report_problem/report_problem_marker_model.dart';
import 'package:flutterapperadauti/app/models/report_problem/report_problem_model.dart';
import 'package:flutterapperadauti/app/pages/report_problem/view/report_problem_report_page.dart';
import 'package:flutterapperadauti/app/repository/authentication/authentication_repository.dart';
import 'package:flutterapperadauti/app/repository/firestore/firestore_repository.dart';
import 'package:flutterapperadauti/app/repository/storage/storage_repository.dart';
import 'package:flutterapperadauti/app/utils/page_state.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:latlong2/latlong.dart' as latLng;

part 'report_problem_state.dart';
part 'report_problem_cubit.freezed.dart';

class ReportProblemCubit extends Cubit<ReportProblemState> {
  final StorageRepository _storageRepository;
  final FirestoreRepository _firestoreRepository;
  final AuthenticationRepository _authRepository;
  ReportProblemCubit({
    required StorageRepository storageRepository,
    required FirestoreRepository firestoreRepository,
    required AuthenticationRepository authRepository,
  })  : _storageRepository = storageRepository,
        _firestoreRepository = firestoreRepository,
        _authRepository = authRepository,
        super(ReportProblemState.initial());

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
        await _determinePosition();
        emit(
          state.copyWith(
            locationEnabled: locationEnabled,
            formzStatus: FormzSubmissionStatus.initial,
            isValid: Formz.validate(
              [
                state.locationEnabled,
                locationEnabled,
              ],
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            position: null,
            locationEnabled: locationEnabled,
            formzStatus: FormzSubmissionStatus.initial,
            isValid: Formz.validate(
              [
                state.locationEnabled,
                locationEnabled,
              ],
            ),
          ),
        );
      }
    } catch (_) {
      const locationEnabled = GenericInput<bool>.dirty(false);
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

  void sendReport(Map<String, String> category) async {
    if (!state.isValid) {
      return;
    }
    try {
      emit(
        state.copyWith(
          formzStatus: FormzSubmissionStatus.inProgress,
        ),
      );
      List<String> urls = [];
      DateTime time = DateTime.now();
      urls.addAll(await _storageRepository.uploadFiles(
          'Notice_A_Problem', state.imagePicker.value));
      Map<String, dynamic> item = ReportProblemItemModel(
        category: state.category.value,
        description: state.description.value,
        email: state.email.value,
        index: category.values.toList().indexOf(state.category.value),
        institution: getInstitution(state.institution.value),
        institutionEmail: state.institution.value,
        name: state.username.value,
        phone: state.phoneNumber.value,
        status: "In lucru",
        lat: state.locationEnabled.value ? state.position!.latitude : null,
        long: state.locationEnabled.value ? state.position!.longitude : null,
        subject: state.subject.value,
        url: urls,
        createdAt: time.toUtc().toString(),
      ).toJson();
      await _firestoreRepository.updateArrayField(
        'collection/Markers',
        'markers',
        elementsToAdd: [item],
      );

      subjectChanged('');
      descriptionChanged('');
      institutionChanged('');
      categoryChanged('');
      phoneNumberChanged('');
      imagePickerChanged([]);
      locationChanged(false);
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.failure));
    }
  }

  void getReports() async {
    try {
      emit(state.copyWith(firestoreStatus: PageState.inProgress));
      var userUID = _authRepository.currentUser.id;
      Logger log = Logger();
      log.d(_authRepository.currentUser.email);

      var result = await _firestoreRepository.fetchDocument('users/$userUID');
      ReportProblemModel data = ReportProblemModel.fromJson(
        result.data() ?? {},
      );
      emit(state.copyWith(
        firestoreStatus: PageState.success,
        myReportsData: data.markers,
      ));
    } on FirestoreFetchFailure catch (e) {
      emit(state.copyWith(
          firestoreStatus: PageState.failure, errorMessage: e.message));
    }
  }

  String getInstitution(String email) => switch (email) {
        'relatiipublice@primariaradauti.ro' => 'Primăria Radauti',
        'office@serviciicomunale.ro' => 'Servicii Comunale',
        'agentia.radauti@acetsv.ro' => 'ACET Rădăuți',
        'contact@cjsuceava.ro' => 'Consiliul Județean Suceava',
        'cjsuceava@gnm.ro' => 'Garda de Mediu Suceava',
        'gardaforestiera.suceava@gmail.com' => 'Garda Forestieră Suceava',
        'dspsv@dspsv.ro' => 'DSP Suceava',
        'marginea@suceava.rosilva.ro' => 'Ocolul Silvic Marginea',
        'radautiulcivic@gmail.com' => 'Asociația Rădăuțiul Civic',
        _ => 'Asociația Rădăuțiul Civic'
      };

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      emit(state.copyWith(positionState: PositionState.initial));
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(state.copyWith(positionState: PositionState.disabled));
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(state.copyWith(positionState: PositionState.denied));
          throw Exception();
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(state.copyWith(positionState: PositionState.deniedForever));
        throw Exception();
      }
      Position position = await Geolocator.getCurrentPosition();
      emit(
        state.copyWith(
          positionState: PositionState.success,
          position: position,
        ),
      );
    } on Exception {
      rethrow;
    }
  }

  void getMarkers() async {
    try {
      emit(state.copyWith(firestoreStatus: PageState.inProgress));
      var result =
          await _firestoreRepository.fetchDocument('collection/Markers');
      ReportProblemMarkerModel data =
          ReportProblemMarkerModel.fromJson(result.data() ?? {});

      List<Marker> markers = [];
      for (ReportProblemItemModel item in data.markers ?? {}) {
        if (item.lat != null && item.long != null) {
          markers.add(
            Marker(
              point: latLng.LatLng(item.lat as double, item.long as double),
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(ReportProblemReportPage.route(data: item));
                  },
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        _icon.entries.elementAt(item.index).value,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      }

      emit(state.copyWith(
        firestoreStatus: PageState.success,
        markersData: markers,
      ));
    } on FirestoreFetchFailure catch (e) {
      emit(state.copyWith(
          firestoreStatus: PageState.failure, errorMessage: e.message));
    }
  }

  final Map<int, IconData> _icon = {
    0: Entypo.dot_3,
    1: Entypo.trash,
    2: FontAwesome5.road,
    3: Entypo.lamp,
    4: Entypo.home,
    5: Octicons.shield_check,
    6: Icons.blur_circular
  };
}
