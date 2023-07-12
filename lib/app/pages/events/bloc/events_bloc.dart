import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../models/events/events_item_model.dart';
import '../../../models/events/new_events_model.dart';
import '../../../models/events/old_events_model.dart';
import '../../../models/user.dart';
import '../../../repository/authentication/authentication_repository.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../repository/storage/storage_repository.dart';
import '../../../utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_event.dart';
part 'events_state.dart';
part 'events_bloc.freezed.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final FirestoreRepository _firestoreRepository;
  final StorageRepository _storageRepository;
  final AuthenticationRepository _authenticationRepository;
  EventsBloc(
    this._firestoreRepository,
    this._storageRepository,
    this._authenticationRepository,
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
                errorMessageNew: e.toString()),
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

          final updatedEvents = await Future.wait(list
              .sublist(list.length > 10 ? list.length - 10 : 0)
              .map((event) async {
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
              errorMessageOld: e.toString(),
            ),
          );
        }
      },
    );

    on<GetFavoriteEvents>(
      (event, emit) async {
        User user = _authenticationRepository.currentUser;
        String path = 'users/${user.id}';
        emit(state.copyWith(favoriteStatus: PageState.inProgress));
        await emit.onEach(
          _firestoreRepository.getFavoriteEvents(
            path,
          ),
          onData: (data) {
            NewEventsModel favEvents =
                NewEventsModel.fromJson(data.data() ?? {});
            return add(EmitFavoriteEventsChanges(favEvents.list));
          },
          onError: (error, stackTrace) => emit(
            state.copyWith(
              favoriteStatus: PageState.failure,
              errorMessageOld: error.toString(),
            ),
          ),
        );
      },
    );
    on<EmitFavoriteEventsChanges>(
      (event, emit) => emit(
        state.copyWith(
          favoriteEvents: event.items,
          favoriteStatus: PageState.success,
        ),
      ),
    );
    on<AddToFavorite>((event, emit) {
      User user = _authenticationRepository.currentUser;
      _firestoreRepository.updateArrayField('users/${user.id}', 'events',
          elementsToAdd: [event.item]);
    });
    on<RemoveFromFavorite>((event, emit) {
      User user = _authenticationRepository.currentUser;
      _firestoreRepository.updateArrayField('users/${user.id}', 'events',
          elementsToRemove: [event.item]);
    });
  }

  @override
  void onChange(Change<EventsState> change) {
    super.onChange(change);
  }
}
