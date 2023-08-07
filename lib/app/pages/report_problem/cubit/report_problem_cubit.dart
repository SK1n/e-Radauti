import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
import 'package:flutterapperadauti/app/form_inputs/report_problem_form.dart';
import 'package:flutterapperadauti/app/models/report_problem/report_problem_model.dart';
import 'package:flutterapperadauti/app/models/user/user_model.dart';
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
import 'package:latlong2/latlong.dart' as lat_lng;

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
        super(const ReportProblemState()) {
    usernameChanged(_authRepository.currentUser.name ?? "");
    emailChanged(_authRepository.currentUser.email ?? "");
    getMarkers();
    getReports();
  }

  void usernameChanged(String value) {
    final name = NameInput.dirty(value);
    emit(
      state.copyWith(
        form: state.form.copyWith(name: name),
        formzStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void subjectChanged(String value) {
    final subject = SubjectInput.dirty(value);
    emit(
      state.copyWith(
        form: state.form.copyWith(subject: subject),
        formzStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void descriptionChanged(String value) {
    final description = DescriptionInput.dirty(value);

    emit(
      state.copyWith(
        form: state.form.copyWith(description: description),
        formzStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void institutionChanged(String value) {
    final institution = InstitutionInput.dirty(value);

    emit(
      state.copyWith(
        form: state.form.copyWith(institution: institution),
        formzStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void categoryChanged(String value) {
    final category = CategoryInput.dirty(value);
    emit(
      state.copyWith(
        form: state.form.copyWith(category: category),
        formzStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void phoneNumberChanged(String value) {
    final phone = PhoneInput.dirty(value);
    emit(
      state.copyWith(
        formzStatus: FormzSubmissionStatus.initial,
        form: state.form.copyWith(phone: phone),
      ),
    );
  }

  void emailChanged(String value) {
    final email = EmailInput.dirty(value);
    emit(
      state.copyWith(
        form: state.form.copyWith(email: email),
        formzStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void imagePickerChanged(List<dynamic>? value) {
    final images = ImageInput.dirty(value ?? []);
    emit(
      state.copyWith(
        form: state.form.copyWith(images: images),
        formzStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void locationChanged(bool value) async {
    final location = LocationInput.dirty(value);
    if (!value) {
      emit(state.copyWith(
        position: null,
        formzStatus: FormzSubmissionStatus.initial,
        form: state.form.copyWith(location: location),
      ));
      return;
    }
    bool serviceEnabled;
    LocationPermission permission;
    emit(state.copyWith(positionState: PositionState.inProgress));
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      emit(state.copyWith(
        positionState: PositionState.disabled,
        form: state.form.copyWith(location: const LocationInput.dirty(false)),
        formzStatus: FormzSubmissionStatus.initial,
        position: null,
      ));
      return;
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(state.copyWith(
          positionState: PositionState.denied,
          form: state.form.copyWith(location: const LocationInput.dirty(false)),
          formzStatus: FormzSubmissionStatus.initial,
          position: null,
        ));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(state.copyWith(
        positionState: PositionState.deniedForever,
        form: state.form.copyWith(location: const LocationInput.dirty(false)),
        position: null,
        formzStatus: FormzSubmissionStatus.initial,
      ));
      return;
    }
    Position position;

    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      emit(state.copyWith(
        positionState: PositionState.success,
        form: state.form.copyWith(location: const LocationInput.dirty(true)),
        position: position,
        formzStatus: FormzSubmissionStatus.initial,
      ));
    } catch (e) {
      emit(state.copyWith(
        positionState: PositionState.failure,
        form: state.form.copyWith(location: const LocationInput.dirty(false)),
        position: null,
        formzStatus: FormzSubmissionStatus.initial,
      ));
    }
  }

  Future<void> sendReport(Map<String, String> category) async {
    emit(
      state.copyWith(
        formzStatus: FormzSubmissionStatus.inProgress,
      ),
    );

    final form = state.form;
    try {
      List<String> urls = [];
      DateTime time = DateTime.now();
      urls.addAll(
        await _storageRepository.uploadFiles(
          'Notice_A_Problem',
          form.images.value,
        ),
      );
      String userUid = _authRepository.currentUser.id;
      ReportProblemModel item = ReportProblemModel(
        category: form.category.value,
        description: form.description.value,
        email: form.email.value,
        index: category.values.toList().indexOf(form.category.value),
        institution: getInstitution(form.institution.value),
        institutionEmail: form.institution.value,
        name: form.name.value,
        phone: form.phone.value,
        status: "In lucru",
        lat: form.location.value ? state.position!.latitude : null,
        long: form.location.value ? state.position!.longitude : null,
        subject: form.subject.value,
        images: urls,
        createdAt: time.toUtc().toString(),
        emailSent: false,
        shouldShowOnMap: form.location.value,
        userUid: userUid,
      );
      await _firestoreRepository.addDocument('reportProblem', item);
      emit(
        state.copyWith(
          formzStatus: FormzSubmissionStatus.success,
          form: state.form.clear(),
        ),
      );
    } on StorageFailure catch (e) {
      emit(
        state.copyWith(
          formzStatus: FormzSubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void getReports() async {
    try {
      emit(state.copyWith(firestoreStatus: PageState.inProgress));
      var userUID = _authRepository.currentUser.id;
      var result = await _firestoreRepository.fetchDocument('users/$userUID');
      UserModel data = UserModel.fromJson(
        result.data() ?? {},
      );
      emit(state.copyWith(
        firestoreStatus: PageState.success,
        myReportsData: data.reports,
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

  void getMarkers() async {
    try {
      emit(state.copyWith(firestoreStatus: PageState.inProgress));
      var result = await _firestoreRepository.getDocuments(
        'reportProblem',
        ReportProblemModel.fromJson,
      );

      List<Marker> markers = [];
      for (ReportProblemModel item in result) {
        if (item.lat != null && item.long != null && item.shouldShowOnMap) {
          markers.add(
            Marker(
              point: lat_lng.LatLng(item.lat as double, item.long as double),
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
    0: FontAwesome5.city,
    1: Octicons.light_bulb,
    2: FontAwesome5.trash,
    3: FontAwesome5.road,
    4: Entypo.home,
    5: Icons.blur_circular,
    6: Octicons.shield_check,
    7: Entypo.dot_3
  };
}
