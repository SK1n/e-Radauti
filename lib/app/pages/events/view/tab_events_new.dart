import 'dart:html';

import 'package:firestore_repository/firestore_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/events/bloc/events_bloc.dart';
import 'package:flutterapperadauti/app/pages/events/bloc/events_bloc.dart';
import 'package:flutterapperadauti/app/pages/events/bloc/events_bloc.dart';
import 'package:flutterapperadauti/app/pages/events/view/item_event.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';
import 'package:storage_repository/storage_repository.dart';

class TabEventsNew extends StatelessWidget {
  const TabEventsNew({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventsBloc>(
      create: (context) => EventsBloc(
        context.read<FirestoreRepository>(),
        context.read<StorageRepository>(),
      )..add(const GetEvents()),
      child: BlocListener<EventsBloc, EventsState>(
        listener: (context, state) {},
        child: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state.status.isInProgress) {
              return const SliverToBoxAdapter(child: LoadingWidget());
            } else if (state.status.isSuccess) {
              return SliverList.builder(
                itemBuilder: (context, index) {
                  return ItemEvent(state.events![index]);
                },
                itemCount: state.events?.length ?? 0,
              );
            } else {
              return SliverToBoxAdapter(
                child: ErrWidget(
                  error: state.errorMessage ?? '',
                  retry: () async => context.read<EventsBloc>().add(
                        const GetEvents(),
                      ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
