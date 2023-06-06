import 'package:flutterapperadauti/dao/app_database.dart';
import 'package:flutterapperadauti/dao/events_dao.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

class DaoController extends BaseController {
  late final AppDatabase database;
  late final EventsDao eventsDao;

  // Non exclusive
  Future<void> remove(dynamic data) async {
    await eventsDao.deleteEvent(data);
  }

  insert(dynamic data) async {
    await eventsDao.insertEvent(data);
  }

  // Events exlusive function
  Future<bool?> eventExists(dynamic data, int id) async {
    return await eventsDao.eventsIsFavorite(id);
  }

  // futurize will only work for 1 variable
  Future<void> getFavoritesEvents() async {
    futurize(() => eventsDao.getSavedEvents());
  }

  @override
  void onReady() async {
    database = await $FloorAppDatabase.databaseBuilder('events_db2.db').build();
    eventsDao = database.eventsDao;
    super.onReady();
  }
}
