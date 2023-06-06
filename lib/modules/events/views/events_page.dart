import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/events/controllers/new_events_controller.dart';
import 'package:flutterapperadauti/modules/events/views/favorites_events_page.dart';
import 'package:flutterapperadauti/modules/events/views/new_events_page.dart';
import 'package:flutterapperadauti/modules/events/views/old_events_page.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_tabs_scaffold.dart';
import 'package:get/get.dart';

class EventsPage extends GetView<NewEventsController> {
  const EventsPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': 'new-events'.tr,
        'widget': const NewEventsPage(),
      },
      {
        'text': 'old-events'.tr,
        'widget': const OldEventsPage(),
      },
      {'text': 'favorites-events'.tr, 'widget': const FavoritesEventsPage()}
    ];

    return AppTabsScaffold(
      tabs: tabs,
      appBarTitle: 'events'.tr,
    );
  }
}
