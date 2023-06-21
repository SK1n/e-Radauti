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

  void getLatestDecision() async {
    try {
      DecisionModel data = await _administrationRepository.getLatestDecision();
      emit(
        state.copyWith(
          newsState: NewsState.success,
          latestDecision: data,
        ),
      );
    } on LocalAdministrationException catch (e) {
      emit(
        state.copyWith(
          newsState: NewsState.failure,
          message: e.message,
        ),
      );
    }
  }
}
