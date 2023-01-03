import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/events/views/new_events_page.dart';
import 'package:flutterapperadauti/modules/events/views/old_events_page.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
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
            icon: const Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
              label: 'old-events'.tr, icon: const Icon(Icons.abc))
        ],
      ),
      tabBuilder: (_, index) => CupertinoTabView(
        builder: (_) => CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: [
              AppBarWidget(content: 'events'.tr),
              SliverPadding(
                padding:
                    const EdgeInsets.only(left: leftMargin, right: rightMargin),
                sliver: SliverFillRemaining(child: pages[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
