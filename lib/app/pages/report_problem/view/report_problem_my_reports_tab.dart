import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/report_problem_cubit.dart';
import 'report_problem_report_page.dart';
import '../../../utils/page_state.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/empty_widget.dart';
import '../../../utils/widgets/err_widget.dart';

class ReportProblemMyReportsTab extends StatelessWidget {
  const ReportProblemMyReportsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportProblemCubit, ReportProblemState>(
      listener: (context, state) {},
      child: BlocBuilder<ReportProblemCubit, ReportProblemState>(
        builder: (context, state) {
          if (state.firestoreStatus.isInProgress) {
            return const SliverToBoxAdapter(child: LoadingWidget());
          } else if (state.firestoreStatus.isSuccess) {
            if (state.myReportsData.isEmpty) {
              return SliverToBoxAdapter(
                child: EmptyWidget(
                  text: t.reportProblem.emptyMyReports,
                ),
              );
            }
            return SliverList.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(state.myReportsData[index].subject),
                    onTap: () => Navigator.of(context).push(
                      ReportProblemReportPage.route(
                        data: state.myReportsData[index],
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.myReportsData.length,
            );
          } else {
            return SliverToBoxAdapter(
              child: ErrWidget(
                  error: state.errorMessage,
                  retry: () async =>
                      context.read<ReportProblemCubit>().getReports()),
            );
          }
        },
      ),
    );
  }
}
