import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/local_administration/cubit/local_administration_cubit.dart';
import 'package:flutterapperadauti/app/repository/local_administration/local_administration_repository.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_scaffold/app_sliver_scaffold.dart';

class LocalCouncilTeam extends StatelessWidget {
  const LocalCouncilTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: LocalAdministrationCubit(
          administrationRepository:
              context.read<LocalAdministrationRepository>()),
      child: AppSliverScaffold(
        appBarTitle: '',
        slivers: [
          BlocListener<LocalAdministrationCubit, LocalAdministrationState>(
            listener: (context, state) {},
            child: BlocBuilder(
              builder: (context, state) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
