import 'package:authentication_repository/authentication_repository.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:flutterapperadauti/app/pages/report_problem/cubit/report_problem_cubit.dart';
import 'package:flutterapperadauti/app/pages/report_problem/view/report_problem_form_tab.dart';
import 'package:flutterapperadauti/app/pages/report_problem/view/report_problem_map_tab.dart';
import 'package:flutterapperadauti/app/pages/report_problem/view/report_problem_my_reports_tab.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_form.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_tabs_scaffold.dart';
import 'package:storage_repository/storage_repository.dart';

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ReportProblemPage());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': t.reportProblem.formTab,
        'widget': const ReportProblemFormTab(),
      },
      {
        'text': t.reportProblem.mapTab,
        'widget': const ReportProblemMapTab(),
      },
      {
        'text': t.reportProblem.myReportsTab,
        'widget': const ReportProblemMyReportsTab(),
      }
    ];
    return BlocProvider.value(
      value: ReportProblemCubit(
        storageRepository: context.read<StorageRepository>(),
        firestoreRepository: context.read<FirestoreRepository>(),
        authRepository: context.read<AuthenticationRepository>(),
      )
        ..usernameChanged(
          context.read<AuthenticationRepository>().currentUser.name ?? "",
        )
        ..emailChanged(
          context.read<AuthenticationRepository>().currentUser.email ?? "",
        )
        ..getMarkers()
        ..getReports()
        ..locationChanged(false),
      child: AppTabsScaffold(
        tabs: tabs,
        appBarTitle: t.reportProblem.title,
      ),
    );
  }
}
