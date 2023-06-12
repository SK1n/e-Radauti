import 'package:floor_repository/floor_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/events/cubit/favorite_events_cubit.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';

import 'event_details_page.dart';
import 'item_event.dart';

class TabEventsFavorites extends StatelessWidget {
  const TabEventsFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteEventsCubit>(
      create: (context) => FavoriteEventsCubit(
        context.read<FloorRepository>(),
      )..getSavedEvents(),
      child: BlocListener<FavoriteEventsCubit, FavoriteEventsState>(
        listener: (context, state) {},
        child: BlocBuilder<FavoriteEventsCubit, FavoriteEventsState>(
          builder: (context, state) {
            if (state.status.isInProgress) {
              return const SliverToBoxAdapter(child: LoadingWidget());
            } else if (state.status.isSuccess) {
              return SliverList.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      EventDetailsPage.route(
                        state.events![index],
                      ),
                    ),
                    child: ItemEvent(
                      state.events![index],
                    ),
                  );
                },
                itemCount: state.events?.length ?? 0,
              );
            } else {
              return SliverToBoxAdapter(
                child: ErrWidget(
                  error: state.errorMessage ?? '',
                  retry: () async =>
                      context.read<FavoriteEventsCubit>().getSavedEvents(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
