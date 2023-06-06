import 'package:flutterapperadauti/controllers/dao_controller.dart';
import 'package:flutterapperadauti/modules/events/controllers/favorites_events_controller.dart';
import 'package:flutterapperadauti/modules/events/controllers/new_events_controller.dart';
import 'package:flutterapperadauti/modules/events/controllers/old_events_controller.dart';
import 'package:get/get.dart';

class EventsBindings implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => NewEventsController()),
      Bind.lazyPut(() => OldEventsController()),
      Bind.lazyPut(() => FavoritesEventsController()),
      Bind.lazyPut(() => DaoController()),
    ];
  }
}
