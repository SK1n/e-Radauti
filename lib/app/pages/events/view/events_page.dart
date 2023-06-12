import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:flutterapperadauti/app/pages/events/view/tab_events_favorites.dart';
import 'package:flutterapperadauti/app/pages/events/view/tab_events_new.dart';
import 'package:flutterapperadauti/app/pages/events/view/tab_events_old.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_tabs_scaffold.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const EventsPage());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': t.events.newEventsTabTitle,
        'widget': const TabEventsNew(),
      },
      {
        'text': t.events.oldEventsTabTitle,
        'widget': const TabEventsOld(),
      },
      {
        'text': t.events.favoritesEventsTabTitle,
        'widget': const TabEventsFavorites(),
      }
    ];
    return AppTabsScaffold(
      tabs: tabs,
      appBarTitle: t.events.title,
    );
  }
}
