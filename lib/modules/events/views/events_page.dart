import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/events/controllers/events_controller.dart';
import 'package:flutterapperadauti/modules/events/views/favorites_events_page.dart';
import 'package:flutterapperadauti/modules/events/views/new_events_page.dart';
import 'package:flutterapperadauti/modules/events/views/old_events_page.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final EventsController eventsController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('events'.tr),
        bottom: TabBar(
          controller: eventsController.tabController,
          tabs: [
            Tab(
              text: 'new-events'.tr,
            ),
            Tab(
              text: 'old-events'.tr,
            ),
            Tab(
              text: 'favorites-events'.tr,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: leftMargin,
          right: rightMargin,
          top: topMargin,
        ),
        child: TabBarView(
          controller: eventsController.tabController,
          children: const [
            NewEventsPage(),
            OldEventsPage(),
            FavoritesEventsPage(),
          ],
        ),
      ),
    );
  }
}
