import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/local_administration/cubit/local_administration_cubit.dart';
import 'package:flutterapperadauti/app/pages/local_administration/item_local_decision.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/empty_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';
import 'package:local_administration/local_administration.dart';

class DecisionsPage extends StatelessWidget {
  const DecisionsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const DecisionsPage());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: context.t.localAdministration.localCouncilDecisions,
      slivers: [
        BlocProvider.value(
          value: LocalAdministrationCubit(
              administrationRepository:
                  context.read<LocalAdministrationRepository>())
            ..getDecisions(),
          child:
              BlocListener<LocalAdministrationCubit, LocalAdministrationState>(
            listener: (context, state) {},
            child:
                BlocBuilder<LocalAdministrationCubit, LocalAdministrationState>(
              builder: (context, state) {
                if (state.localDecisionState.isInProgress) {
                  return const LoadingWidget();
                } else if (state.localDecisionState.isSuccess) {
                  if (state.localDecisions.isEmpty) {
                    return EmptyWidget(
                      text: t.localAdministration.emptyLocalDecisions,
                    );
                  }
                  return Column(
                    children: [
                      SearchBar(
                        hintText: 'Search...',
                        trailing: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ItemLocalDecision(
                            item: state.localDecisions[index],
                          );
                        },
                        itemCount: state.localDecisions.length,
                      ),
                    ],
                  );
                } else {
                  return ErrWidget(
                      error: state.errorMessageLocalDecisions ?? '',
                      retry: () async =>
                          context.read<LocalAdministrationCubit>()
                            ..getDecisions());
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
