import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/events/views/new_events_page.dart';
import 'package:flutterapperadauti/modules/events/views/old_events_page.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              AppBarUi(
                pinned: true,
                content: 'events'.tr,
                leading: Icons.calendar_today,
                bottom: TabBar(
                  indicatorWeight: 3.0,
                  tabs: [
                    Tab(
                      text: 'new-events'.tr,
                    ),
                    Tab(
                      text: 'old-events'.tr,
                    )
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              NewEventsPage(),
              OldEventsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
