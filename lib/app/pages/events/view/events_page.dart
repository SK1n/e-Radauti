import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/events_bloc.dart';
import 'tab_events_favorites.dart';
import 'tab_events_new.dart';
import 'tab_events_old.dart';
import '../../../repository/authentication/authentication_repository.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../repository/storage/storage_repository.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/scaffolds/app_tabs_scaffold.dart';

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
    // return AppTabsScaffold(
    //   tabs: tabs,
    //   appBarTitle: t.events.title,
    // );
    return BlocProvider.value(
      value: EventsBloc(
        context.read<FirestoreRepository>(),
        context.read<StorageRepository>(),
        context.read<AuthenticationRepository>(),
      )
        ..add(const GetNewEvents())
        ..add(const GetOldEvents()),
      child: AppTabsScaffold(
        tabs: tabs,
        appBarTitle: t.events.title,
      ),
    );
  }
}
