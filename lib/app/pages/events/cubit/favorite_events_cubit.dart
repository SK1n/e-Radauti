import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:floor_repository/floor_repository.dart';

part 'favorite_events_state.dart';

class FavoriteEventsCubit extends Cubit<FavoriteEventsState> {
  FavoriteEventsCubit(this._floorRepository)
      : super(const FavoriteEventsState());

  final FloorRepository _floorRepository;

  Future<void> getSavedEvents() async {
    try {
      emit(state.copyWith(status: FloorRepositoryStatus.inProgress));
      final events = await _floorRepository.getFavoritesEvents();
      emit(state.copyWith(
          events: events, status: FloorRepositoryStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(status: FloorRepositoryStatus.failure));
    }
  }
}
