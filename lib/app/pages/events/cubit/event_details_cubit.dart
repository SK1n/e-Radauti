import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:floor_repository/floor_repository.dart';

part 'event_details_state.dart';

class EventDetailsCubit extends Cubit<EventDetailsState> {
  EventDetailsCubit(this._floorRepository) : super(const EventDetailsState());

  final FloorRepository _floorRepository;

  void isFavoriteChanged(int id) async {
    final isFavorite = await _floorRepository.eventsIsFavorite(id);
    emit(state.copyWith(isFavorite: isFavorite));
  }

  void toggleIsFavorite(EventsItemModel event) async {
    if (state.isFavorite) {
      await _floorRepository.deleteEvent(event);
      emit(state.copyWith(isFavorite: false));
    } else {
      await _floorRepository.insertEvent(event);
      emit(state.copyWith(isFavorite: true));
    }
  }
}
