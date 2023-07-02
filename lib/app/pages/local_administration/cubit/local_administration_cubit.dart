import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/models/local_administration/decision_model.dart';
import 'package:flutterapperadauti/app/models/local_administration/local_council_model.dart';
import 'package:flutterapperadauti/app/repository/firestore/firestore_repository.dart';
import 'package:flutterapperadauti/app/repository/local_administration/local_administration_repository.dart';
import 'package:flutterapperadauti/app/repository/storage/storage_repository.dart';
import 'package:flutterapperadauti/app/utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'local_administration_state.dart';
part 'local_administration_cubit.freezed.dart';

class LocalAdministrationCubit extends Cubit<LocalAdministrationState> {
  final LocalAdministrationRepository _administrationRepository;
  final FirestoreRepository _firestoreRepository;
  final StorageRepository _storageRepository;
  LocalAdministrationCubit({
    required LocalAdministrationRepository administrationRepository,
    required FirestoreRepository firestoreRepository,
    required StorageRepository storageRepository,
  })  : _administrationRepository = administrationRepository,
        _firestoreRepository = firestoreRepository,
        _storageRepository = storageRepository,
        super(const LocalAdministrationState());

  void getLastDecision() async {
    try {
      emit(state.copyWith(newsState: PageState.inProgress));
      DecisionModel data = await _administrationRepository.getLatestDecision();
      emit(
        state.copyWith(
          newsState: PageState.success,
          latestDecision: data,
        ),
      );
    } on LocalAdministrationException catch (e) {
      emit(
        state.copyWith(
          newsState: PageState.failure,
          errorMessageNews: e.message,
        ),
      );
    }
  }

  void getDecisions() async {
    try {
      emit(state.copyWith(localDecisionState: PageState.inProgress));
      List<DecisionModel> data = await _administrationRepository.getDecisions();
      emit(
        state.copyWith(
          localDecisionState: PageState.success,
          localDecisions: data,
        ),
      );
    } on LocalAdministrationException catch (e) {
      emit(
        state.copyWith(
          localDecisionState: PageState.failure,
          errorMessageLocalDecisions: e.message,
        ),
      );
    }
  }

  void filterLocalDecisions(String query) {
    emit(state.copyWith(localDecisionState: PageState.inProgress));
    var data = state.localDecisions
        .where((element) => element.title.toLowerCase().contains(query))
        .toList();
    Logger log = Logger();
    log.d(data);
    emit(
      state.copyWith(
        localDecisionState: PageState.success,
        fillteredLocalDecisions: data,
      ),
    );
  }

  void removeFilter() {
    emit(state.copyWith(fillteredLocalDecisions: []));
  }
}
