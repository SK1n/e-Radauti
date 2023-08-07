import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/models/events/event_model.dart';
import 'package:flutterapperadauti/app/models/user/user_model.dart';
import 'package:flutterapperadauti/app/repository/authentication/authentication_repository.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../models/local_administration/decision_model.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../repository/local_administration/local_administration_repository.dart';
import '../../../repository/storage/storage_repository.dart';
import '../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final FirestoreRepository _firestoreRepository;
  final LocalAdministrationRepository _localAdministrationRepository;
  final StorageRepository _storageRepository;
  final AuthenticationRepository _authenticationRepository;
  HomeCubit({
    required FirestoreRepository firestoreRepository,
    required LocalAdministrationRepository localAdministrationRepository,
    required StorageRepository storageRepository,
    required AuthenticationRepository authenticationRepository,
  })  : _firestoreRepository = firestoreRepository,
        _localAdministrationRepository = localAdministrationRepository,
        _storageRepository = storageRepository,
        _authenticationRepository = authenticationRepository,
        super(const HomeState()) {
    getLatestDecision();
    getNextEvent();
    if (_authenticationRepository.isAnnonymous()) {
      emit(
        state.copyWith(
          numsOfReports: 0,
          isAnnonymous: _authenticationRepository.isAnnonymous(),
        ),
      );
    } else {
      getNumsOfReports();
    }
  }

  void getLatestDecision() async {
    try {
      emit(state.copyWith(dmState: PageState.inProgress));
      var data = await _localAdministrationRepository.getLatestDecision();
      emit(state.copyWith(dmState: PageState.success, dmData: data));
    } catch (e) {
      emit(state.copyWith(dmState: PageState.failure, dmErrorMessage: ''));
    }
  }

  void getNumsOfReports() async {
    try {
      var uid = _authenticationRepository.currentUser.id;
      emit(state.copyWith(numsOfReportsState: PageState.inProgress));

      var data = await _firestoreRepository
          .fetchDocument('${AppConstants.firebaseUser}/$uid');
      UserModel rpum = UserModel.fromJson(data.data() ?? {});
      emit(state.copyWith(
          numsOfReports: rpum.reports.length,
          numsOfReportsState: PageState.success));
    } catch (e) {
      emit(state.copyWith(numsOfReportsState: PageState.failure));
    }
  }

  void getNextEvent() async {
    try {
      emit(state.copyWith(eventState: PageState.inProgress));
      List<dynamic> data = await _firestoreRepository.getDocuments(
        AppConstants.pathEvents,
        EventModel.fromJson,
      );
      List<EventModel> list = [];
      for (var element in data) {
        list.add(element);
      }
      list.sort((a, b) => a.startTimestamp.compareTo(b.startTimestamp));
      var tempUrl =
          await _storageRepository.getFileDownloadUrl(list.first.imageUrl);
      var item = list.first.copyWith(imageUrl: tempUrl);
      emit(
        state.copyWith(
          eventState: PageState.success,
          eventData: item,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(eventState: PageState.failure, eventError: ''));
    }
  }
}
