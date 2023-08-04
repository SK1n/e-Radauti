import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../models/volunteering/volunteering_model.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../repository/storage/storage_repository.dart';
import '../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteering_state.dart';
part 'volunteering_cubit.freezed.dart';

class VolunteeringCubit extends Cubit<VolunteeringState> {
  final FirestoreRepository _firestoreRepository;
  final StorageRepository _storageRepository;
  VolunteeringCubit({
    required FirestoreRepository firestoreRepository,
    required StorageRepository storageRepository,
  })  : _firestoreRepository = firestoreRepository,
        _storageRepository = storageRepository,
        super(const VolunteeringState());

  void getData() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      var data = await _firestoreRepository
          .fetchDocument(AppConstants.pathVolunteering);
      VolunteeringModel vm = VolunteeringModel.fromJson(data.data() ?? {});
      List<VolunteeringItemModel> list = vm.items;
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
