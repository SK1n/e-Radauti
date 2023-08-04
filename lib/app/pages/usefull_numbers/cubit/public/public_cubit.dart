import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../../models/usefull_numbers/public/public_model.dart';
import '../../../../repository/firestore/firestore_repository.dart';
import '../../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_state.dart';
part 'public_cubit.freezed.dart';

class PublicCubit extends Cubit<PublicState> {
  final FirestoreRepository _firestoreRepository;
  PublicCubit({
    required FirestoreRepository firestoreRepository,
  })  : _firestoreRepository = firestoreRepository,
        super(const PublicState()) {
    getData();
  }

  void getData() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      var data =
          await _firestoreRepository.fetchDocument(AppConstants.pathNumbers);
      PublicModel am = PublicModel.fromJson(data.data() ?? {});
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
