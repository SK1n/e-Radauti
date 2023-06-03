import 'package:flutterapperadauti/dao/app_database.dart';
import 'package:flutterapperadauti/dao/events_dao.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';

class DaoController extends BaseController {
  late final AppDatabase database;
  late final EventsDao eventsDao;

  @override
  void onReady() async {
    database = await $FloorAppDatabase.databaseBuilder('events_db.db').build();
    eventsDao = database.eventsDao;
    super.onReady();
  }
}
