import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../../models/transport/train/train_model.dart';
import '../../../../repository/firestore/firestore_repository.dart';
import '../../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'train_state.dart';
part 'train_cubit.freezed.dart';

class TrainCubit extends Cubit<TrainState> {
  final FirestoreRepository _firestoreRepository;
  TrainCubit({
    required FirestoreRepository firestoreRepository,
  })  : _firestoreRepository = firestoreRepository,
        super(const TrainState()) {
    getData();
  }

  void getData() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      var data =
          await _firestoreRepository.fetchDocument(AppConstants.pathTrain);
      TrainModel tm = TrainModel.fromJson(data.data() ?? {});

      emit(
        state.copyWith(
          data: tm.items,
          state: PageState.success,
        ),
      );
    } on FirestoreFetchFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          state: PageState.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          state: PageState.failure,
        ),
      );
    }
  }
}
