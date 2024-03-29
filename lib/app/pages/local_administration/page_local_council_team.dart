import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../models/local_administration/local_council_model.dart';
import 'cubit/team/local_council_team_cubit.dart';
import '../../repository/firestore/firestore_repository.dart';
import '../../repository/storage/storage_repository.dart';
import '../../utils/page_state.dart';
import '../../../gen/strings.g.dart';
import '../../utils/widgets/loading_widget.dart';
import '../../utils/scaffolds/app_sliver_scaffold.dart';
import '../../utils/widgets/empty_widget.dart';
import '../../utils/widgets/err_widget.dart';
import '../../utils/widgets/image_widget.dart';

import 'package:url_launcher/url_launcher_string.dart';

class PageLocalCouncilTeam extends StatelessWidget {
  const PageLocalCouncilTeam({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
        builder: (_) => const PageLocalCouncilTeam());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: LocalCouncilTeamCubit(
          firestoreRepository: context.read<FirestoreRepository>(),
          storageRepository: context.read<StorageRepository>())
        ..getData(),
      child: AppSliverScaffold(
        appBarTitle: context.t.localAdministration.localCouncilTeam,
        slivers: [
          BlocConsumer<LocalCouncilTeamCubit, LocalCouncilTeamState>(
            builder: (context, state) {
              if (state.state.isInProgress) {
                return const SliverToBoxAdapter(child: LoadingWidget());
              } else if (state.state.isFalure) {
                return SliverToBoxAdapter(
                  child: ErrWidget(
                    error: state.errorMessage,
                    retry: () async =>
                        context.read<LocalCouncilTeamCubit>().getData(),
                  ),
                );
              } else if (state.data.isEmpty) {
                return SliverToBoxAdapter(
                  child: EmptyWidget(
                    text: context.t.events.emptyFavorites,
                  ),
                );
              } else {
                return SliverList.builder(
                  itemBuilder: (context, index) {
                    var item = state.data[index];
                    return _ItemCard(data: item);
                  },
                  itemCount: state.data.length,
                );
              }
            },
            listener: (context, state) {},
          ),
        ],
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final LocalCouncilItemModel data;
  const _ItemCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.innerCardPadding,
      child: Card(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: ImageWidget(
                    link: data.imageUrl,
                    fit: BoxFit.fill,
                    imageBuilder: (context, image) {
                      return AspectRatio(aspectRatio: 3 / 2, child: image);
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: AppConstants.leftDelimiter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.function,
                              style: AppConstants.smallTextTextStyle),
                          Text('${data.firstname} ${data.surname}',
                              style: AppConstants.titleBigTextStyle),
                          Row(
                            children: [
                              data.tel.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.phone),
                                      onPressed: () async {
                                        await launchUrlString(
                                          'tel:${data.tel}',
                                        );
                                      },
                                    )
                                  : Container(),
                              data.email.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.email),
                                      onPressed: () async {
                                        await launchUrlString(
                                          'mailto:${data.email}',
                                        );
                                      },
                                    )
                                  : Container(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/local_administration/${data.party.toLowerCase()}.png',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
