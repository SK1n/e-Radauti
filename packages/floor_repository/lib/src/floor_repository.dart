import 'package:firestore_repository/firestore_repository.dart';
import 'package:floor/floor.dart';
import 'package:floor_repository/src/dao/app_database.dart';
import 'package:floor_repository/src/dao/events_dao.dart';

enum FloorRepositoryStatus {
  /// The function has not yet been started.
  initial,

  /// The function is in the process.
  inProgress,

  /// The function ended successfully.
  success,

  /// The function ended with failed.
  failure,

  /// The function has been canceled.
  canceled
}

extension FloorReposityStatusX on FloorRepositoryStatus {
  bool get isInitial => this == FloorRepositoryStatus.initial;

  bool get isInProgress => this == FloorRepositoryStatus.inProgress;

  bool get isSuccess => this == FloorRepositoryStatus.success;

  bool get isFailure => this == FloorRepositoryStatus.failure;

  bool get isCanceled => this == FloorRepositoryStatus.canceled;

  bool get isInProgressOrSuccess => isInProgress || isSuccess;
}

class FloorException implements Exception {
  const FloorException([
    this.message = 'An unknown exception occurred.',
  ]);

  /// The associated error [message].
  final String message;
}

class FloorRepository {
  FloorRepository({AppDatabase? appDatabase})
      : _appDatabase = appDatabase != null
            ? Future.value(appDatabase)
            : _initializeAppDatabase();

  final Future<AppDatabase> _appDatabase;

  static Future<AppDatabase> _initializeAppDatabase() async {
    return await $FloorAppDatabase.databaseBuilder("events_db.db").build();
  }

  Future<EventsDao> get eventsDao async {
    final appDatabase = await _appDatabase;
    return appDatabase.eventsDao;
  }

  Future<List<EventsItemModel>> getFavoritesEvents() async {
    try {
      final lEventsDao = await eventsDao;
      return await lEventsDao.getSavedEvents();
    } catch (e) {
      throw FloorException();
    }
  }

  Future<void> insertEvent(EventsItemModel event) async {
    try {
      final lEventsDao = await eventsDao;
      return await lEventsDao.insertEvent(event);
    } catch (e) {
      throw FloorException();
    }
  }

  Future<void> deleteEvent(EventsItemModel event) async {
    try {
      final lEventsDao = await eventsDao;
      return await lEventsDao.deleteEvent(event);
    } catch (e) {
      throw FloorException();
    }
  }

  Future<bool?> eventsIsFavorite(int id) async {
    try {
      final lEventsDao = await eventsDao;
      return await lEventsDao.eventsIsFavorite(id);
    } catch (e) {
      throw FloorException();
    }
  }
}
