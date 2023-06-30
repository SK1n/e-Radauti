import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/local_administration/cubit/local_administration_cubit.dart';
import 'package:flutterapperadauti/app/pages/local_administration/item_local_decision.dart';
import 'package:flutterapperadauti/app/repository/local_administration/local_administration_repository.dart';
import 'package:flutterapperadauti/app/utils/page_state.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_sliver_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/empty_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';

class DecisionsPage extends StatelessWidget {
  const DecisionsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const DecisionsPage());
  }

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = SearchController();
    return BlocProvider.value(
      value: LocalAdministrationCubit(
          administrationRepository:
              context.read<LocalAdministrationRepository>())
        ..getDecisions(),
      child: AppSliverScaffold(
        appBarTitle: context.t.localAdministration.localCouncilDecisions,
        slivers: [
          BlocListener<LocalAdministrationCubit, LocalAdministrationState>(
            listener: (context, state) {},
            child:
                BlocBuilder<LocalAdministrationCubit, LocalAdministrationState>(
              builder: (context, state) {
                return SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverToBoxAdapter(
                    child: SearchBar(
                      controller: searchController,
                      hintText: 'Search...',
                      trailing: [
                        state.fillteredLocalDecisions.isEmpty
                            ? IconButton(
                                onPressed: () =>
                                    context.read<LocalAdministrationCubit>()
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
                                      .read<LocalAdministrationCubit>()
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
          BlocListener<LocalAdministrationCubit, LocalAdministrationState>(
            listener: (context, state) {},
            child:
                BlocBuilder<LocalAdministrationCubit, LocalAdministrationState>(
              builder: (context, state) {
                if (state.localDecisionState.isInProgress) {
                  return const SliverToBoxAdapter(child: LoadingWidget());
                } else if (state.localDecisionState.isSuccess) {
                  if (state.localDecisions.isEmpty) {
                    return SliverToBoxAdapter(
                      child: EmptyWidget(
                        text: t.localAdministration.emptyLocalDecisions,
                      ),
                    );
                  }
                  return state.fillteredLocalDecisions.isEmpty
                      ? SliverList.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ItemLocalDecision(
                                item: state.localDecisions[index],
                              ),
                            );
                          },
                          itemCount: state.localDecisions.length,
                        )
                      : SliverList.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ItemLocalDecision(
                                item: state.fillteredLocalDecisions[index],
                              ),
                            );
                          },
                          itemCount: state.fillteredLocalDecisions.length,
                        );
                } else {
                  return SliverToBoxAdapter(
                    child: ErrWidget(
                      error: state.errorMessageLocalDecisions ?? '',
                      retry: () async =>
                          context.read<LocalAdministrationCubit>()
                            ..getDecisions(),
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
