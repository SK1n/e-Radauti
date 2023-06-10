import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:storage_repository/storage_repository.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final FirestoreRepository _firestoreRepository;
  final StorageRepository _storageRepository;
  EventsBloc(
    this._firestoreRepository,
    this._storageRepository,
  ) : super(const EventsState()) {
    on<GetNewEvents>(
      (event, emit) async {
        try {
          emit(state.copyWith(status: FirestoreRepositoryStatus.inProgress));
          var result = await _firestoreRepository.getDataFromDocumentArray(
            path: 'collection/Events',
            converter: NewEventsModel.fromJson,
          );
          List<EventsItemModel> list = result.list;
          List<EventsItemModel> listWithDownloadUrls = [];
          String tempDownloadUrl;
          for (EventsItemModel item in list) {
            tempDownloadUrl =
                await _storageRepository.getFileDownloadUrl(item.url);
            EventsItemModel tempItem = EventsItemModel(
              item.category,
              item.description,
              item.headline,
              item.location,
              item.host,
              item.street,
              item.start,
              item.end,
              tempDownloadUrl,
              item.id,
            );
            listWithDownloadUrls.add(tempItem);
          }
          emit(state.copyWith(
            status: FirestoreRepositoryStatus.success,
            events: listWithDownloadUrls,
          ));
        } on FirestoreException catch (e) {
          emit(
            state.copyWith(
              errorMessage: e.message,
              status: FirestoreRepositoryStatus.failure,
            ),
          );
        } on StorageException catch (e) {
          emit(
            state.copyWith(
              errorMessage: e.message,
              status: FirestoreRepositoryStatus.failure,
            ),
          );
        } catch (_) {
          emit(state.copyWith(status: FirestoreRepositoryStatus.failure));
        }
      },
    );

    on<GetOldEvents>(
      (event, emit) async {
        try {
          emit(state.copyWith(status: FirestoreRepositoryStatus.inProgress));
          var result = await _firestoreRepository.getDataFromDocumentArray(
            path: 'collection/OldEvents',
            converter: OldEventsModel.fromJson,
          );
          List<EventsItemModel> list = result.list;
          List<EventsItemModel> listWithDownloadUrls = [];
          String tempDownloadUrl;
          for (EventsItemModel item in list) {
            tempDownloadUrl =
                await _storageRepository.getFileDownloadUrl(item.url);
            EventsItemModel tempItem = EventsItemModel(
              item.category,
              item.description,
              item.headline,
              item.location,
              item.host,
              item.street,
              item.start,
              item.end,
              tempDownloadUrl,
              item.id,
            );
            listWithDownloadUrls.add(tempItem);
          }
          emit(state.copyWith(
            status: FirestoreRepositoryStatus.success,
            events: listWithDownloadUrls,
          ));
        } on FirestoreException catch (e) {
          emit(
            state.copyWith(
              errorMessage: e.message,
              status: FirestoreRepositoryStatus.failure,
            ),
          );
        } on StorageException catch (e) {
          emit(
            state.copyWith(
              errorMessage: e.message,
              status: FirestoreRepositoryStatus.failure,
            ),
          );
        } catch (_) {
          emit(state.copyWith(status: FirestoreRepositoryStatus.failure));
        }
      },
    );
  }
}
