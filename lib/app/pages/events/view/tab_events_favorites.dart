import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/pages/events/bloc/events_bloc.dart';
import 'package:flutterapperadauti/app/repository/authentication/authentication_repository.dart';
import 'package:flutterapperadauti/app/repository/firestore/firestore_repository.dart';
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
        context.read<AuthenticationRepository>(),
      )..add(const GetFavoriteEvents()),
      child: BlocListener<EventsBloc, EventsState>(
        listener: (context, state) {},
        child: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state.favoriteStatus.isInProgress) {
              return const SliverToBoxAdapter(child: LoadingWidget());
            } else if (state.favoriteStatus.isSuccess) {
              if (state.favoriteEvents?.isEmpty ?? true) {
                return SliverToBoxAdapter(
                  child: EmptyWidget(
                    text: t.events.emptyFavorites,
                  ),
                );
              }
              return SliverList.builder(
                itemBuilder: (context, index) {
                  return ItemEvent(
                    state.favoriteEvents![index],
                  );
                },
                itemCount: state.favoriteEvents?.length ?? 0,
              );
            } else {
              return SliverToBoxAdapter(
                child: ErrWidget(
                  error: state.errorMessageFavorites ?? '',
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
