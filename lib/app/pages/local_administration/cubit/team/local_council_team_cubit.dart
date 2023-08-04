import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../../models/local_administration/local_council_model.dart';
import '../../../../repository/firestore/firestore_repository.dart';
import '../../../../repository/storage/storage_repository.dart';
import '../../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_council_team_state.dart';
part 'local_council_team_cubit.freezed.dart';

class LocalCouncilTeamCubit extends Cubit<LocalCouncilTeamState> {
  final FirestoreRepository _firestoreRepository;
  final StorageRepository _storageRepository;
  LocalCouncilTeamCubit({
    required FirestoreRepository firestoreRepository,
    required StorageRepository storageRepository,
  })  : _firestoreRepository = firestoreRepository,
        _storageRepository = storageRepository,
        super(const LocalCouncilTeamState()) {
    getData();
  }

  void getData() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      var data = await _firestoreRepository
          .fetchDocument(AppConstants.pathLocalCouncil);
      LocalCouncilModel lcm = LocalCouncilModel.fromJson(data.data() ?? {});
      List<LocalCouncilItemModel> updatedList = [];

      for (LocalCouncilItemModel item in lcm.items) {
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
