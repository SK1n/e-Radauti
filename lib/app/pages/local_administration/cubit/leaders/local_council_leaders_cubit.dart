import 'package:bloc/bloc.dart';
import '../../../../models/local_administration/local_council_leaders_model.dart';
import '../../../../repository/firestore/firestore_repository.dart';
import '../../../../repository/storage/storage_repository.dart';
import '../../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_council_leaders_state.dart';
part 'local_council_leaders_cubit.freezed.dart';

class LocalCouncilLeadersCubit extends Cubit<LocalCouncilLeadersState> {
  final FirestoreRepository _firestoreRepository;
  final StorageRepository _storageRepository;
  LocalCouncilLeadersCubit({
    required FirestoreRepository firestoreRepository,
    required StorageRepository storageRepository,
  })  : _firestoreRepository = firestoreRepository,
        _storageRepository = storageRepository,
        super(const LocalCouncilLeadersState());

  void getData() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      var data = await _firestoreRepository.fetchDocument('collection/Leaders');
      LocalCouncilLeadersModel lclm =
          LocalCouncilLeadersModel.fromJson(data.data() ?? {});
      List<LocalCouncilLeadersItemModel> updatedList = [];

      for (LocalCouncilLeadersItemModel item in lclm.items) {
        var url = await _storageRepository.getFileDownloadUrl(item.imageUrl);
        updatedList.add(item.copyWith(imageUrl: url));
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
