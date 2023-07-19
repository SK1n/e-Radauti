import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/events_bloc.dart';
import 'item_event.dart';
import '../../../utils/page_state.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/empty_widget.dart';
import '../../../utils/widgets/err_widget.dart';

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
            if (state.newEvents.isEmpty) {
              return SliverToBoxAdapter(
                child: EmptyWidget(
                  text: t.events.emptyEvents,
                ),
              );
            }
            return SliverList.builder(
              itemBuilder: (context, index) {
                return ItemEvent(
                  state.newEvents[index],
                );
              },
              itemCount: state.newEvents.length,
            );
          } else {
            return SliverToBoxAdapter(
              child: ErrWidget(
                error: state.errorMessageNew,
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
