import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/repository/local_administration/local_administration_repository.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';
import 'package:flutterapperadauti/app/pages/local_administration/cubit/local_administration_cubit.dart';
import 'package:flutterapperadauti/app/pages/local_administration/tab_local_council.dart';
import 'package:flutterapperadauti/app/pages/local_administration/tab_news_page.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_tabs_scaffold.dart';

class LocalAdministrationPage extends StatelessWidget {
  const LocalAdministrationPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
        builder: (_) => const LocalAdministrationPage());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': t.localAdministration.newsTab,
        'widget': const TabNewsPage(),
      },
      {
        'text': t.localAdministration.localCouncilTab,
        'widget': const TabLocalCouncil(),
      },
      // {
      //   'text': t.events.favoritesEventsTabTitle,
      //   'widget': const TabEventsFavorites(),
      // }
    ];
    return BlocProvider.value(
      value: LocalAdministrationCubit(
          administrationRepository:
              context.read<LocalAdministrationRepository>())
        ..getLastDecision(),
      child: AppTabsScaffold(
        tabs: tabs,
        appBarTitle: t.localAdministration.title,
      ),
    );
  }
}
