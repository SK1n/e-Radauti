import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../cubit/authorities/authorities_cubit.dart';
import '../cubit/public/public_cubit.dart';
import '../cubit/upsets/upsets_cubit.dart';
import 'tab_authorities.dart';
import 'tab_public.dart';
import 'tab_upsets.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/scaffolds/app_tabs_scaffold.dart';

class PageUsefullNumbers extends StatelessWidget {
  const PageUsefullNumbers({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const PageUsefullNumbers());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': context.t.usefullNumbers.authoritiesTab,
        'widget': const TabAuthorities(),
      },
      {
        'text': context.t.usefullNumbers.publicTab,
        'widget': const TabPublic(),
      },
      {
        'text': context.t.usefullNumbers.upsetsTab,
        'widget': const TabUpsets(),
      }
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthoritiesCubit(
            firestoreRepository: context.read<FirestoreRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => PublicCubit(
            firestoreRepository: context.read<FirestoreRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UpsetsCubit(
            firestoreRepository: context.read<FirestoreRepository>(),
          ),
        ),
      ],
      child: AppTabsScaffold(
        tabs: tabs,
        expandedHeight: AppConstants.expandedHeight,
        appBarTitle: context.t.usefullNumbers.title,
      ),
    );
  }
}
