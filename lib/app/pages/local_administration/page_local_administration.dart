import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/local_administration/page_local_council_team.dart';
import 'package:flutterapperadauti/app/pages/local_administration/tab_local_council_leaders.dart';
import 'package:flutterapperadauti/app/repository/firestore/firestore_repository.dart';
import 'package:flutterapperadauti/app/repository/local_administration/local_administration_repository.dart';
import 'package:flutterapperadauti/app/repository/storage/storage_repository.dart';
import 'package:flutterapperadauti/gen/strings.g.dart';
import 'package:flutterapperadauti/app/pages/local_administration/cubit/local_administration_cubit.dart';
import 'package:flutterapperadauti/app/pages/local_administration/tab_local_council.dart';
import 'package:flutterapperadauti/app/pages/local_administration/tab_news_page.dart';
import 'package:flutterapperadauti/repositories/firebase_repository.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_tabs_scaffold.dart';

class PageLocalAdministration extends StatelessWidget {
  const PageLocalAdministration({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
        builder: (_) => const PageLocalAdministration());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': t.localAdministration.localCouncilTab,
        'widget': const TabLocalCouncil(),
      },
      {
        'text': t.localAdministration.localCouncilLeaders,
        'widget': const TabLocalCouncilLeaders(),
      }
    ];
    return BlocProvider.value(
      value: LocalAdministrationCubit(
        administrationRepository: context.read<LocalAdministrationRepository>(),
        firestoreRepository: context.read<FirestoreRepository>(),
        storageRepository: context.read<StorageRepository>(),
      )..getLastDecision(),
      child: AppTabsScaffold(
        tabs: tabs,
        expandedHeight: 150,
        appBarTitle: t.localAdministration.title,
      ),
    );
  }
}
