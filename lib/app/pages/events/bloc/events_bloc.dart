import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapperadauti/app/models/events/events_item_model.dart';
import 'package:flutterapperadauti/app/models/events/new_events_model.dart';
import 'package:flutterapperadauti/app/models/events/old_events_model.dart';
import 'package:flutterapperadauti/app/repository/firestore/firestore_repository.dart';
import 'package:flutterapperadauti/app/repository/floor/floor_repository.dart';
import 'package:flutterapperadauti/app/repository/storage/storage_repository.dart';
import 'package:flutterapperadauti/app/utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_event.dart';
part 'events_state.dart';
part 'events_bloc.freezed.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final FirestoreRepository _firestoreRepository;
  final StorageRepository _storageRepository;
  final FloorRepository _floorRepository;
  EventsBloc(
    this._firestoreRepository,
    this._storageRepository,
    this._floorRepository,
  ) : super(const EventsState()) {
    on<GetNewEvents>(
      (event, emit) async {
        try {
          emit(state.copyWith(newEventsStatus: PageState.inProgress));
          var result =
              await _firestoreRepository.fetchDocument('collection/Events');
          NewEventsModel data = NewEventsModel.fromJson(result.data() ?? {});
          List<EventsItemModel> list = data.list;
          final updatedEvents = await Future.wait(list.map((event) async {
            final tempDownloadUrl =
                await _storageRepository.getFileDownloadUrl(event.url);
            return event.copyWith(url: tempDownloadUrl);
          }));
          emit(state.copyWith(
            newEventsStatus: PageState.success,
            newEvents: updatedEvents,
          ));
        } catch (e) {
          emit(
            state.copyWith(
              newEventsStatus: PageState.failure,
            ),
          );
        }
      },
    );

    on<GetOldEvents>(
      (event, emit) async {
        emit(state.copyWith(oldEventsStatus: PageState.inProgress));
        try {
          var result =
              await _firestoreRepository.fetchDocument('collection/OldEvents');
          OldEventsModel data = OldEventsModel.fromJson(result.data() ?? {});
          List<EventsItemModel> list = data.list;

          final updatedEvents = await Future.wait(
              list.sublist(list.length - 10).map((event) async {
            final tempDownloadUrl =
                await _storageRepository.getFileDownloadUrl(event.url);
            return event.copyWith(url: tempDownloadUrl);
          }));
          emit(state.copyWith(
            oldEventsStatus: PageState.success,
            oldEvents: updatedEvents,
          ));
        } catch (e) {
          emit(
            state.copyWith(
              oldEventsStatus: PageState.failure,
            ),
          );
        }
      },
    );
    on<GetFavoriteEvents>((event, emit) async {
      try {
        emit(state.copyWith(floorStatus: PageState.inProgress));
        final events = await _floorRepository.getFavoritesEvents();
        emit(state.copyWith(
            favoritesEvents: events, floorStatus: PageState.success));
      } catch (e) {
        debugPrint(e.toString());
        emit(state.copyWith(floorStatus: PageState.failure));
      }
    });
  }
}
