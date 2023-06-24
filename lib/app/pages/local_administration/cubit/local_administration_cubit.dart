import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_administration/local_administration.dart';

part 'local_administration_state.dart';
part 'local_administration_cubit.freezed.dart';

class LocalAdministrationCubit extends Cubit<LocalAdministrationState> {
  final LocalAdministrationRepository _administrationRepository;
  LocalAdministrationCubit({
    required LocalAdministrationRepository administrationRepository,
  })  : _administrationRepository = administrationRepository,
        super(
          LocalAdministrationState.initial(),
        );

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
        .where((element) => element.title.toLowerCase() == query.toLowerCase())
        .toList();
    emit(
      state.copyWith(
        localDecisionState: PageState.success,
        fillteredLocalDecisions: data,
      ),
    );
  }
}
