import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../cubit/report_problem_cubit.dart';
import 'report_problem_form_tab.dart';
import 'report_problem_map_tab.dart';
import 'report_problem_my_reports_tab.dart';
import '../../../repository/authentication/authentication_repository.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../repository/storage/storage_repository.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/scaffolds/app_tabs_scaffold.dart';

class ReportProblemPage extends StatelessWidget {
  const ReportProblemPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ReportProblemPage());
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        'text': context.t.reportProblem.formTab,
        'widget': const ReportProblemFormTab(),
      },
      {
        'text': context.t.reportProblem.mapTab,
        'widget': const ReportProblemMapTab(),
      },
      {
        'text': context.t.reportProblem.myReportsTab,
        'widget': const ReportProblemMyReportsTab(),
      }
    ];
    return BlocProvider.value(
      value: ReportProblemCubit(
        storageRepository: context.read<StorageRepository>(),
        firestoreRepository: context.read<FirestoreRepository>(),
        authRepository: context.read<AuthenticationRepository>(),
      ),
      child: AppTabsScaffold(
          tabs: tabs,
          appBarTitle: context.t.reportProblem.title,
          expandedHeight: AppConstants.expandedHeight),
    );
  }
}
