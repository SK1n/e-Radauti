import 'package:bloc/bloc.dart';
import '../../../../models/usefull_numbers/upsets/upsets_model.dart';
import '../../../../repository/firestore/firestore_repository.dart';
import '../../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upsets_state.dart';
part 'upsets_cubit.freezed.dart';

class UpsetsCubit extends Cubit<UpsetsState> {
  final FirestoreRepository _firestoreRepository;
  UpsetsCubit({
    required FirestoreRepository firestoreRepository,
  })  : _firestoreRepository = firestoreRepository,
        super(const UpsetsState());

  void getData() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      var data = await _firestoreRepository.fetchDocument('collection/Numbers');
      UpsetsModel am = UpsetsModel.fromJson(data.data() ?? {});
      emit(
        state.copyWith(
          data: am.items,
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
