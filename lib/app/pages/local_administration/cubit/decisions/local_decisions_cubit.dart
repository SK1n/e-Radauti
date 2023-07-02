import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/models/local_administration/decision_model.dart';
import 'package:flutterapperadauti/app/repository/local_administration/local_administration_repository.dart';
import 'package:flutterapperadauti/app/utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_decisions_state.dart';
part 'local_decisions_cubit.freezed.dart';

class LocalDecisionsCubit extends Cubit<LocalDecisionsState> {
  final LocalAdministrationRepository _localAdministrationRepository;
  LocalDecisionsCubit({
    required LocalAdministrationRepository localAdministrationRepository,
  })  : _localAdministrationRepository = localAdministrationRepository,
        super(const LocalDecisionsState());

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
    var data = state.data
        .where((element) => element.title.toLowerCase().contains(query))
        .toList();
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
