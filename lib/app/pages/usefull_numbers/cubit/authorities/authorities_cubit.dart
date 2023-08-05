import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../../models/usefull_numbers/authorities/authorities_model.dart';
import '../../../../repository/firestore/firestore_repository.dart';
import '../../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorities_state.dart';
part 'authorities_cubit.freezed.dart';

class AuthoritiesCubit extends Cubit<AuthoritiesState> {
  final FirestoreRepository _firestoreRepository;
  AuthoritiesCubit({
    required FirestoreRepository firestoreRepository,
  })  : _firestoreRepository = firestoreRepository,
        super(const AuthoritiesState()) {
    getData();
  }

  void getData() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      var data =
          await _firestoreRepository.fetchDocument(AppConstants.pathNumbers);
      AuthoritiesModel am = AuthoritiesModel.fromJson(data.data() ?? {});
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
