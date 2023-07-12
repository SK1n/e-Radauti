import 'package:bloc/bloc.dart';
import '../../../../models/announcements/local_announcements_model.dart';
import '../../../../repository/firestore/firestore_repository.dart';
import '../../../../repository/storage/storage_repository.dart';
import '../../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_announcement_state.dart';
part 'local_announcement_cubit.freezed.dart';

class LocalAnnouncementCubit extends Cubit<LocalAnnouncementState> {
  final FirestoreRepository _firestoreRepository;
  final StorageRepository _storageRepository;
  LocalAnnouncementCubit({
    required FirestoreRepository firestoreRepository,
    required StorageRepository storageRepository,
  })  : _firestoreRepository = firestoreRepository,
        _storageRepository = storageRepository,
        super(const LocalAnnouncementState());
  void getData() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      var data =
          await _firestoreRepository.fetchDocument('collection/Announcements');
      LocalAnnouncementsModel lam =
          LocalAnnouncementsModel.fromJson(data.data() ?? {});
      List<LocalAnnouncementsItemModel> list = lam.items;
      final updatedList = await Future.wait(list.map((item) async {
        final tempDownloadUrl =
            await _storageRepository.getFileDownloadUrl(item.image);
        return item.copyWith(image: tempDownloadUrl);
      }));

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
      emit(state.copyWith(state: PageState.failure));
    }
  }
}
