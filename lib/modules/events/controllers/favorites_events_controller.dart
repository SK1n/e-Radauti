import 'package:flutterapperadauti/controllers/dao_controller.dart';
import 'package:flutterapperadauti/data/models/events/events_item_model2.dart';
import 'package:flutterapperadauti/utils/base_controller.dart';
import 'package:get/get.dart';

class FavoritesEventsController extends BaseController<List<EventsItemModel2>> {
  DaoController daoController = Get.find();
  Future<void> getFavoritesEvents() async {
    // futurize(() async {
    //   //   List<EventsItemModel2> events =
    //   //       await daoController.eventsDao.getSavedEvents();
    //   //  return events;
    //   return ;
    // });
  }

  Future<bool?> eventIsFavorite(EventsItemModel2 event) async {
    return null;

    //return await daoController.eventsDao.eventsIsFavorite(event.id!);
  }

  Future<void> removeEvent(EventsItemModel2 event) async {
    //  await daoController.eventsDao.deleteEvent(event);
  }

  insertEvent(EventsItemModel2 event) async {
    // await daoController.eventsDao.insertEvent(event);
  }

  @override
  void onReady() async {
    super.onReady();
    await getFavoritesEvents();
  }
}
