import 'package:flutterapperadauti/controllers/dao_controller.dart';
import 'package:flutterapperadauti/data/models/events/events_item_model.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get.dart';

class FavoritesEventsController extends BaseController<List<EventsItemModel>> {
  DaoController daoController = Get.find();
  Future<void> getFavoritesEvents() async {
    futurize(() async {
      List<EventsItemModel> events =
          await daoController.eventsDao.getSavedEvents();
      return events;
    });
  }

  Future<bool?> eventIsFavorite(EventsItemModel event) async {
    return await daoController.eventsDao.eventsIsFavorite(event.id!);
  }

  Future<void> removeEvent(EventsItemModel event) async {
    await daoController.eventsDao.deleteEvent(event);
  }

  insertEvent(EventsItemModel event) async {
    await daoController.eventsDao.insertEvent(event);
  }

  @override
  void onReady() async {
    super.onReady();
    await getFavoritesEvents();
  }
}
