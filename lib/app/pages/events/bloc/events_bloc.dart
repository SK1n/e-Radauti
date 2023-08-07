import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapperadauti/app/models/events/event_model.dart';
import 'package:flutterapperadauti/app/models/user/user_model.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
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
          List<dynamic> data = await _firestoreRepository.getDocuments(
            AppConstants.pathEvents,
            EventModel.fromJson,
          );

          debugPrint(data.runtimeType.toString());

          List<EventModel> updatedEvents = [];
          for (EventModel element in data) {
            String tempUrl = await _storageRepository.getFileDownloadUrl(
              element.imageUrl,
            );
            updatedEvents.add(element.copyWith(imageUrl: tempUrl));
          }
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
          List<EventModel> data = await _firestoreRepository.getDocuments(
            AppConstants.pathEvents,
            EventModel.fromJson,
          );
          final updatedEvents = await Future.wait(
            data.sublist(data.length > 10 ? data.length - 10 : 0).map(
              (event) async {
                final tempDownloadUrl =
                    await _storageRepository.getFileDownloadUrl(event.imageUrl);
                return event.copyWith(imageUrl: tempDownloadUrl);
              },
            ),
          );
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
        if (_authenticationRepository.isAnnonymous()) {
          emit(state.copyWith(isAnnonymous: true));
          return;
        }
        User user = _authenticationRepository.currentUser;
        String path = '${AppConstants.firebaseUser}/${user.id}';
        emit(state.copyWith(favoriteStatus: PageState.inProgress));
        await emit.onEach(
          _firestoreRepository.getDataStream(
            path,
          ),
          onData: (data) {
            UserModel favEvents = UserModel.fromJson(data.data() ?? {});
            return add(
              EmitFavoriteEventsChanges(
                favEvents.events,
              ),
            );
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
      _firestoreRepository.updateArrayField(
          '${AppConstants.firebaseUser}/${user.id}', 'events',
          elementsToAdd: [event.item]);
    });
    on<RemoveFromFavorite>((event, emit) {
      User user = _authenticationRepository.currentUser;
      _firestoreRepository.updateArrayField(
          '${AppConstants.firebaseUser}/${user.id}', 'events',
          elementsToRemove: [event.item]);
    });

    add(const GetNewEvents());
    add(const GetOldEvents());
    add(const GetFavoriteEvents());
  }
}
