import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/utils/widgets/annonymous_widget.dart';
import '../bloc/events_bloc.dart';
import '../../../repository/authentication/authentication_repository.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../repository/storage/storage_repository.dart';
import '../../../utils/page_state.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/empty_widget.dart';
import '../../../utils/widgets/err_widget.dart';
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
      ),
      child: BlocListener<EventsBloc, EventsState>(
        listener: (context, state) {},
        child: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state.isAnnonymous) {
              return const SliverToBoxAdapter(child: AnnonymousWidget());
            }
            if (state.favoriteStatus.isInProgress) {
              return const SliverToBoxAdapter(child: LoadingWidget());
            } else if (state.favoriteStatus.isSuccess) {
              if (state.favoriteEvents.isEmpty) {
                return SliverToBoxAdapter(
                  child: EmptyWidget(
                    text: context.t.events.emptyFavorites,
                  ),
                );
              }
              return SliverList.builder(
                itemBuilder: (context, index) {
                  return ItemEvent(
                    state.favoriteEvents[index],
                  );
                },
                itemCount: state.favoriteEvents.length,
              );
            } else {
              return SliverToBoxAdapter(
                child: ErrWidget(
                  error: state.errorMessageFavorites,
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
