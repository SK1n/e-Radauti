import 'package:firestore_repository/firestore_repository.dart';
import 'package:floor_repository/floor_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:flutterapperadauti/app/pages/events/bloc/events_bloc.dart';
import 'package:flutterapperadauti/app/pages/events/view/item_event.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/empty_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';
import 'package:storage_repository/storage_repository.dart';

import 'event_details_page.dart';

class TabEventsNew extends StatefulWidget {
  const TabEventsNew({super.key});

  @override
  State<TabEventsNew> createState() => _TabEventsNewState();
}

class _TabEventsNewState extends State<TabEventsNew>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<EventsBloc, EventsState>(
      listener: (context, state) {},
      child: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          if (state.newEventsStatus.isInProgress) {
            return const SliverToBoxAdapter(child: LoadingWidget());
          } else if (state.newEventsStatus.isSuccess) {
            if (state.newEvents?.isEmpty ?? true) {
              return SliverToBoxAdapter(
                child: EmptyWidget(
                  text: t.events.emptyEvents,
                ),
              );
            }
            return SliverList.builder(
              itemBuilder: (context, index) {
                return ItemEvent(
                  state.newEvents![index],
                );
              },
              itemCount: state.newEvents?.length ?? 0,
            );
          } else {
            return SliverToBoxAdapter(
              child: ErrWidget(
                error: state.errorMessage ?? '',
                retry: () async => context.read<EventsBloc>().add(
                      const GetNewEvents(),
                    ),
              ),
            );
          }
        },
      ),
    );
  }
}
