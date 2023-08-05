import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/repository/authentication/authentication_repository.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../models/events/events_item_model.dart';
import '../../../models/events/new_events_model.dart';
import '../../../models/local_administration/decision_model.dart';
import '../../../models/report_problem/report_problem_user_model.dart';
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
      ReportProblemUserModel rpum =
          ReportProblemUserModel.fromJson(data.data() ?? {});
      emit(state.copyWith(
          numsOfReports: rpum.markers.length,
          numsOfReportsState: PageState.success));
    } catch (e) {
      emit(state.copyWith(numsOfReportsState: PageState.failure));
    }
  }

  void getNextEvent() async {
    try {
      emit(state.copyWith(eventState: PageState.inProgress));
      var data =
          await _firestoreRepository.fetchDocument(AppConstants.pathEvents);
      List<EventsItemModel> list = [];
      NewEventsModel newEventsModel =
          NewEventsModel.fromJson(data.data() ?? {});
      list.addAll(newEventsModel.list);
      list.sort((a, b) => a.start.compareTo(b.start));
      var tempUrl = await _storageRepository.getFileDownloadUrl(list.first.url);
      var item = list.first.copyWith(url: tempUrl);
      emit(
        state.copyWith(
          eventState: PageState.success,
          eventData: item,
        ),
      );
    } catch (e) {
      emit(state.copyWith(eventState: PageState.failure, eventError: ''));
    }
  }
}
