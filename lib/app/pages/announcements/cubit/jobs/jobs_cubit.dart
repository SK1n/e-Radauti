import 'package:bloc/bloc.dart';
import '../../../../models/e_radauti_website/e_radauti_website_model.dart';
import '../../../../repository/e_radauti_website/e_radauti_website_repository.dart';
import '../../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jobs_state.dart';
part 'jobs_cubit.freezed.dart';

class JobsCubit extends Cubit<JobsState> {
  final ERadautiWebsiteRepository _eRadautiWebsiteRepository;
  JobsCubit({
    required ERadautiWebsiteRepository eRadautiWebsiteRepository,
  })  : _eRadautiWebsiteRepository = eRadautiWebsiteRepository,
        super(const JobsState());

  void getData() async {
    try {
      emit(state.copyWith(state: PageState.inProgress));
      ERadautiWebsiteModel data = await _eRadautiWebsiteRepository.fetchData(
        'https://www.eradauti.ro/api/context?pathname=/anunturi/locuri-de-munca-20',
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
