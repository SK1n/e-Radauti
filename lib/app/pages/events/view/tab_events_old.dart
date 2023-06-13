import 'package:firestore_repository/firestore_repository.dart';
import 'package:floor_repository/floor_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:flutterapperadauti/app/pages/events/bloc/events_bloc.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/empty_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';
import 'package:storage_repository/storage_repository.dart';

import 'item_event.dart';

class TabEventsOld extends StatefulWidget {
  const TabEventsOld({super.key});

  @override
  State<TabEventsOld> createState() => _TabEventsOldState();
}

class _TabEventsOldState extends State<TabEventsOld>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<EventsBloc>(
      create: (context) => EventsBloc(
        context.read<FirestoreRepository>(),
        context.read<StorageRepository>(),
        context.read<FloorRepository>(),
      )..add(const GetOldEvents()),
      child: BlocListener<EventsBloc, EventsState>(
        listener: (context, state) {},
        child: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state.status.isInProgress) {
              return const SliverToBoxAdapter(child: LoadingWidget());
            } else if (state.status.isSuccess) {
              if (state.events?.isEmpty ?? true) {
                return SliverToBoxAdapter(
                  child: EmptyWidget(
                    text: t.events.emptyEvents,
                  ),
                );
              }
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
                        const GetOldEvents(),
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
