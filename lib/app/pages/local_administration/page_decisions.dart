import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/local_administration/cubit/decisions/local_decisions_cubit.dart';
import 'package:flutterapperadauti/app/pages/local_administration/cubit/local_administration_cubit.dart';
import 'package:flutterapperadauti/app/pages/local_administration/item_local_decision.dart';
import 'package:flutterapperadauti/app/repository/firestore/firestore_repository.dart';
import 'package:flutterapperadauti/app/repository/local_administration/local_administration_repository.dart';
import 'package:flutterapperadauti/app/repository/storage/storage_repository.dart';
import 'package:flutterapperadauti/app/utils/page_state.dart';
import 'package:flutterapperadauti/gen/strings.g.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_sliver_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/empty_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';

class PageDecisions extends StatelessWidget {
  const PageDecisions({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const PageDecisions());
  }

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = SearchController();
    return BlocProvider.value(
      value: LocalDecisionsCubit(
        localAdministrationRepository:
            context.read<LocalAdministrationRepository>(),
      )..getDecisions(),
      child: AppSliverScaffold(
        appBarTitle: context.t.localAdministration.localCouncilDecisions,
        slivers: [
          BlocListener<LocalDecisionsCubit, LocalDecisionsState>(
            listener: (context, state) {},
            child: BlocBuilder<LocalDecisionsCubit, LocalDecisionsState>(
              builder: (context, state) {
                return SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverToBoxAdapter(
                    child: SearchBar(
                      controller: searchController,
                      hintText: t.localAdministration.search,
                      trailing: [
                        state.dataFilter.isEmpty
                            ? IconButton(
                                onPressed: () =>
                                    context.read<LocalDecisionsCubit>()
                                      ..filterLocalDecisions(
                                        searchController.text,
                                      ),
                                icon: const Icon(
                                  Icons.search,
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  context
                                      .read<LocalDecisionsCubit>()
                                      .removeFilter();
                                  searchController.clear();
                                },
                                icon: const Icon(
                                  Icons.close,
                                ),
                              )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          BlocListener<LocalDecisionsCubit, LocalDecisionsState>(
            listener: (context, state) {},
            child: BlocBuilder<LocalDecisionsCubit, LocalDecisionsState>(
              builder: (context, state) {
                if (state.state.isInProgress) {
                  return const SliverToBoxAdapter(child: LoadingWidget());
                } else if (state.state.isSuccess) {
                  if (state.data.isEmpty) {
                    return SliverToBoxAdapter(
                      child: EmptyWidget(
                        text: t.localAdministration.emptyLocalDecisions,
                      ),
                    );
                  }
                  return state.dataFilter.isEmpty
                      ? SliverList.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ItemLocalDecision(
                                item: state.data[index],
                              ),
                            );
                          },
                          itemCount: state.data.length,
                        )
                      : SliverList.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ItemLocalDecision(
                                item: state.dataFilter[index],
                              ),
                            );
                          },
                          itemCount: state.dataFilter.length,
                        );
                } else {
                  return SliverToBoxAdapter(
                    child: ErrWidget(
                      error: state.errorMessage,
                      retry: () async =>
                          context.read<LocalDecisionsCubit>()..getDecisions(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
