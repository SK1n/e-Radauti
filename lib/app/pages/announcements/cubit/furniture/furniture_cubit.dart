import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../../models/e_radauti_website/e_radauti_website_model.dart';
import '../../../../repository/e_radauti_website/e_radauti_website_repository.dart';
import '../../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'furniture_state.dart';
part 'furniture_cubit.freezed.dart';

class FurnitureCubit extends Cubit<FurnitureState> {
  final ERadautiWebsiteRepository _eRadautiWebsiteRepository;
  FurnitureCubit({
    required ERadautiWebsiteRepository eRadautiWebsiteRepository,
  })  : _eRadautiWebsiteRepository = eRadautiWebsiteRepository,
        super(const FurnitureState()) {
    getData();
  }

  void getData() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      ERadautiWebsiteModel data = await _eRadautiWebsiteRepository.fetchData(
        AppConstants.furnitureLink,
      );
      emit(
        state.copyWith(
          data: data.context.posts.records,
          state: PageState.success,
        ),
      );
    } on ERadautiWebsiteFetchFailure catch (e) {
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
