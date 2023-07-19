import 'package:bloc/bloc.dart';
import '../../../../models/transport/taxi/taxi_model.dart';
import '../../../../repository/firestore/firestore_repository.dart';
import '../../../../repository/storage/storage_repository.dart';
import '../../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'taxi_state.dart';
part 'taxi_cubit.freezed.dart';

class TaxiCubit extends Cubit<TaxiState> {
  final FirestoreRepository _firestoreRepository;
  final StorageRepository _storageRepository;
  TaxiCubit({
    required FirestoreRepository firestoreRepository,
    required StorageRepository storageRepository,
  })  : _firestoreRepository = firestoreRepository,
        _storageRepository = storageRepository,
        super(const TaxiState());

  void getData() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      var data = await _firestoreRepository.fetchDocument('collection/Taxi');
      TaxiModel tm = TaxiModel.fromJson(data.data() ?? {});
      List<TaxiItemModel> updatedList = [];

      for (TaxiItemModel item in tm.items) {
        var url = await _storageRepository.getFileDownloadUrl(item.url);
        if (url != "") {
          updatedList.add(item.copyWith(url: url));
        }
      }
      emit(
        state.copyWith(
          data: updatedList,
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
