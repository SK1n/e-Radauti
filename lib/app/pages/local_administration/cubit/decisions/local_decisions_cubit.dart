import 'package:bloc/bloc.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:fuzzywuzzy/model/extracted_result.dart';
import 'package:logger/logger.dart';
import '../../../../models/local_administration/decision_model.dart';
import '../../../../repository/local_administration/local_administration_repository.dart';
import '../../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_decisions_state.dart';
part 'local_decisions_cubit.freezed.dart';

class LocalDecisionsCubit extends Cubit<LocalDecisionsState> {
  final LocalAdministrationRepository _localAdministrationRepository;
  LocalDecisionsCubit({
    required LocalAdministrationRepository localAdministrationRepository,
  })  : _localAdministrationRepository = localAdministrationRepository,
        super(const LocalDecisionsState()) {
    getDecisions();
  }

  void getDecisions() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      List<DecisionModel> data =
          await _localAdministrationRepository.getDecisions();
      emit(
        state.copyWith(
          state: PageState.success,
          data: data,
        ),
      );
    } on LocalAdministrationException catch (e) {
      emit(
        state.copyWith(
          state: PageState.failure,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(state.copyWith(state: PageState.failure, errorMessage: ''));
    }
  }

  void filterLocalDecisions(String query) {
    emit(state.copyWith(state: PageState.inProgress));
    List<DecisionModel> data = [];
    var processedData = extractAllSorted(
      query: query,
      choices: state.data.map((e) => e.title).toList(),
      cutoff: 50,
    );
    for (var element in processedData) {
      data.add(state.data[element.index]);
    }
    Logger log = Logger();
    log.d(data);

    emit(
      state.copyWith(
        state: PageState.success,
        dataFilter: data,
      ),
    );
  }

  void removeFilter() {
    emit(state.copyWith(dataFilter: []));
  }
}
