import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:floor/floor.dart';
import 'package:floor_repository/floor_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:storage_repository/storage_repository.dart';

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
          emit(state.copyWith(
              newEventsStatus: FirestoreSubmissionStatus.inProgress));
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
            newEventsStatus: FirestoreSubmissionStatus.success,
            newEvents: updatedEvents,
          ));
        } catch (e) {
          emit(
            state.copyWith(
              newEventsStatus: FirestoreSubmissionStatus.failure,
            ),
          );
        }
      },
    );

    on<GetOldEvents>(
      (event, emit) async {
        emit(state.copyWith(
            oldEventsStatus: FirestoreSubmissionStatus.inProgress));
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
            oldEventsStatus: FirestoreSubmissionStatus.success,
            oldEvents: updatedEvents,
          ));
        } catch (e) {
          emit(
            state.copyWith(
              oldEventsStatus: FirestoreSubmissionStatus.failure,
            ),
          );
        }
      },
    );
    on<GetFavoriteEvents>((event, emit) async {
      try {
        emit(state.copyWith(floorStatus: FloorRepositoryStatus.inProgress));
        final events = await _floorRepository.getFavoritesEvents();
        emit(state.copyWith(
            favoritesEvents: events,
            floorStatus: FloorRepositoryStatus.success));
      } catch (e) {
        debugPrint(e.toString());
        emit(state.copyWith(floorStatus: FloorRepositoryStatus.failure));
      }
    });
  }
}
