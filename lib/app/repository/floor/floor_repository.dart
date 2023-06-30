import 'package:flutterapperadauti/app/models/events/events_item_model.dart';
import 'package:flutterapperadauti/app/repository/floor/dao/events_database.dart';
import 'package:flutterapperadauti/app/repository/floor/dao/events_item_dao.dart';

class FloorException implements Exception {
  const FloorException([
    this.message = 'An unknown exception occurred.',
  ]);

  /// The associated error [message].
  final String message;
}

class FloorRepository {
  FloorRepository({EventsDatabase? appDatabase})
      : _appDatabase = appDatabase != null
            ? Future.value(appDatabase)
            : _initializeAppDatabase();

  final Future<EventsDatabase> _appDatabase;

  static Future<EventsDatabase> _initializeAppDatabase() async {
    return await $FloorAppDatabase.databaseBuilder("events_db3.db").build();
  }

  Future<EventsItemDao> get eventsDao async {
    final appDatabase = await _appDatabase;
    return appDatabase.eventsItemDao;
  }

  Future<List<EventsItemModel>> getFavoritesEvents() async {
    try {
      final lEventsDao = await eventsDao;
      return await lEventsDao.getSavedEvents();
    } catch (e) {
      throw const FloorException();
    }
  }

  Future<void> insertEvent(EventsItemModel event) async {
    try {
      final lEventsDao = await eventsDao;
      return await lEventsDao.insertEvent(event);
    } catch (e) {
      throw const FloorException();
    }
  }

  Future<void> deleteEvent(EventsItemModel event) async {
    try {
      final lEventsDao = await eventsDao;
      return await lEventsDao.deleteEvent(event);
    } catch (e) {
      throw const FloorException();
    }
  }

  Future<bool?> eventsIsFavorite(int id) async {
    try {
      final lEventsDao = await eventsDao;
      return await lEventsDao.eventsIsFavorite(id);
    } catch (e) {
      throw const FloorException();
    }
  }
}
