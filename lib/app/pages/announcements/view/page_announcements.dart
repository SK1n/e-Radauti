import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/furniture/furniture_cubit.dart';
import '../cubit/jobs/jobs_cubit.dart';
import '../cubit/local/local_announcement_cubit.dart';
import 'tab_furniture_announcement.dart';
import 'tab_jobs_announcement.dart';
import 'tab_local_announcement.dart';
import '../../../repository/e_radauti_website/e_radauti_website_repository.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../repository/storage/storage_repository.dart';
import '../../../utils/scaffolds/app_tabs_scaffold.dart';
import '../../../../gen/strings.g.dart';

class PageAnnouncements extends StatelessWidget {
  const PageAnnouncements({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const PageAnnouncements());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': t.announcements.tabLocal,
        'widget': const TabLocalAnnouncement(),
      },
      {
        'text': t.announcements.tabJobs,
        'widget': const TabJobsAnnouncement(),
      },
      {
        'text': t.announcements.tabFurniture,
        'widget': const TabFurnitureAnnouncement(),
      },
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalAnnouncementCubit(
            firestoreRepository: context.read<FirestoreRepository>(),
            storageRepository: context.read<StorageRepository>(),
          )..getData(),
        ),
        BlocProvider(
          create: (context) => FurnitureCubit(
            eRadautiWebsiteRepository:
                context.read<ERadautiWebsiteRepository>(),
          )..getData(),
        ),
        BlocProvider(
          create: (context) => JobsCubit(
            eRadautiWebsiteRepository:
                context.read<ERadautiWebsiteRepository>(),
          )..getData(),
        ),
      ],
      child: AppTabsScaffold(
        tabs: tabs,
        expandedHeight: 150.0,
        appBarTitle: t.announcements.title,
      ),
    );
  }
}
