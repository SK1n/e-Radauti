import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/local_administration/cubit/local_administration_cubit.dart';
import 'package:flutterapperadauti/app/pages/local_administration/preview_pdf.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:local_administration/local_administration.dart';

import 'item_local_decision.dart';

class TabNewsPage extends StatelessWidget {
  const TabNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocalAdministrationCubit, LocalAdministrationState>(
      listener: (context, state) {},
      child: BlocBuilder<LocalAdministrationCubit, LocalAdministrationState>(
        builder: (context, state) {
          if (state.newsState.isInProgress) {
            return const SliverToBoxAdapter(child: LoadingWidget());
          } else if (state.newsState.isSuccess) {
            return SliverToBoxAdapter(
              child: ItemLocalDecision(
                item: state.latestDecision,
              ),
            );
          } else {
            return SliverToBoxAdapter(
              child: ErrWidget(
                  error: state.errorMessageNews ?? '',
                  retry: () async => context.read<LocalAdministrationCubit>()
                    ..getLastDecision()),
            );
          }
        },
      ),
    );
  }
}
