import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/events/bloc/events_bloc.dart';
import 'package:flutterapperadauti/app/repository/firestore/firestore_repository.dart';
import 'package:flutterapperadauti/app/repository/floor/floor_repository.dart';
import 'package:flutterapperadauti/app/repository/storage/storage_repository.dart';
import 'package:flutterapperadauti/app/utils/page_state.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/empty_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';
import 'item_event.dart';

class TabEventsFavorites extends StatelessWidget {
  const TabEventsFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventsBloc>(
      create: (context) => EventsBloc(
        context.read<FirestoreRepository>(),
        context.read<StorageRepository>(),
        context.read<FloorRepository>(),
      )..add(const GetFavoriteEvents()),
      child: BlocListener<EventsBloc, EventsState>(
        listener: (context, state) {},
        child: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state.floorStatus.isInProgress) {
              return const SliverToBoxAdapter(child: LoadingWidget());
            } else if (state.floorStatus.isSuccess) {
              if (state.favoritesEvents?.isEmpty ?? true) {
                return SliverToBoxAdapter(
                  child: EmptyWidget(
                    text: t.events.emptyFavorites,
                  ),
                );
              }
              return SliverList.builder(
                itemBuilder: (context, index) {
                  return ItemEvent(
                    state.favoritesEvents![index],
                  );
                },
                itemCount: state.favoritesEvents?.length ?? 0,
              );
            } else {
              return SliverToBoxAdapter(
                child: ErrWidget(
                  error: state.errorMessage ?? '',
                  retry: () async =>
                      context.read<EventsBloc>().add(const GetFavoriteEvents()),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
