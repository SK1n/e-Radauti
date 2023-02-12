import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/events/views/new_events_page.dart';
import 'package:flutterapperadauti/modules/events/views/old_events_page.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_cupertino_page_scaffold.dart';
import 'package:get/get.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [NewEventsPage(), OldEventsPage()];
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            label: 'new-events'.tr,
            icon: const Icon(Icons.calendar_today_outlined),
          ),
          BottomNavigationBarItem(
            label: 'old-events'.tr,
            icon: const Icon(
              Icons.calendar_month_outlined,
            ),
          ),
        ],
      ),
      tabBuilder: (_, index) => CupertinoTabView(
        builder: (_) => CustomCupertinoPageScaffold(
          navBarLeading: InkWell(
            child: const Icon(CupertinoIcons.back),
            onTap: () => Get.back(),
          ),
          navBarMiddle: 'events'.tr,
          slivers: [
            SliverToBoxAdapter(child: pages[index]),
          ],
        ),
      ),
    );
  }
}
