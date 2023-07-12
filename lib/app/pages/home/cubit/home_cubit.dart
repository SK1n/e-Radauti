import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final FirebaseAuth _auth;
  HomeCubit({
    required FirestoreRepository firestoreRepository,
    required LocalAdministrationRepository localAdministrationRepository,
    required StorageRepository storageRepository,
    FirebaseAuth? auth,
  })  : _firestoreRepository = firestoreRepository,
        _localAdministrationRepository = localAdministrationRepository,
        _storageRepository = storageRepository,
        _auth = auth ?? FirebaseAuth.instance,
        super(const HomeState());

  void getLatestDecision() async {
    try {
      emit(state.copyWith(dmState: PageState.inProgress));
      var data = await _localAdministrationRepository.getLatestDecision();
      emit(state.copyWith(dmState: PageState.success, dmData: data));
    } catch (e) {
      emit(state.copyWith(dmState: PageState.failure, dmErrorMessage: ''));
    }
  }

  void isUserAnnonymous() async {
    if (_auth.currentUser!.isAnonymous) {
      emit(state.copyWith(isAnnonymous: true));
    } else {
      emit(state.copyWith(isAnnonymous: false));
    }
  }

  void getNumsOfReports() async {
    if (_auth.currentUser!.isAnonymous) {
      return;
    }
    try {
      var uid = _auth.currentUser!.uid;
      emit(state.copyWith(numsOfReportsState: PageState.inProgress));

      var data = await _firestoreRepository.fetchDocument('user/$uid');
      ReportProblemUserModel rpm =
          ReportProblemUserModel.fromJson(data.data() ?? {});
      emit(state.copyWith(
          numsOfReports: rpm.markers.length,
          numsOfReportsState: PageState.success));
    } catch (e) {
      emit(state.copyWith(numsOfReportsState: PageState.failure));
    }
  }

  void getNextEvent() async {
    try {
      emit(state.copyWith(eventState: PageState.inProgress));
      var data = await _firestoreRepository.fetchDocument('collection/Events');
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
