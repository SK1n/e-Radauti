import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../models/local_administration/local_council_leaders_model.dart';
import 'cubit/leaders/local_council_leaders_cubit.dart';
import 'page_leader_details.dart';
import '../../repository/firestore/firestore_repository.dart';
import '../../repository/storage/storage_repository.dart';
import '../../utils/page_state.dart';
import '../../../gen/strings.g.dart';
import '../../utils/widgets/loading_widget.dart';
import '../../utils/widgets/empty_widget.dart';
import '../../utils/widgets/err_widget.dart';
import '../../utils/widgets/image_widget.dart';

import 'package:url_launcher/url_launcher_string.dart';

class TabLocalCouncilLeaders extends StatelessWidget {
  const TabLocalCouncilLeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: LocalCouncilLeadersCubit(
        firestoreRepository: context.read<FirestoreRepository>(),
        storageRepository: context.read<StorageRepository>(),
      ),
      child: BlocConsumer<LocalCouncilLeadersCubit, LocalCouncilLeadersState>(
        builder: (context, state) {
          if (state.state.isInProgress) {
            return const SliverToBoxAdapter(child: LoadingWidget());
          } else if (state.state.isFalure) {
            return SliverToBoxAdapter(
              child: ErrWidget(
                error: state.errorMessage,
                retry: () async =>
                    context.read<LocalCouncilLeadersCubit>().getData(),
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
    );
  }
}

class _ItemCard extends StatelessWidget {
  final LocalCouncilLeadersItemModel data;
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
                height: 200,
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
              Padding(
                padding: AppConstants.leftDelimiter,
                child:
                    Text(data.function, style: AppConstants.smallTextTextStyle),
              ),
              Padding(
                padding: AppConstants.leftDelimiter,
                child: Text('${data.firstName} ${data.surname}',
                    style: AppConstants.titleBigTextStyle),
              ),
              Padding(
                padding: AppConstants.leftDelimiter,
                child: Row(
                  children: [
                    data.fbUrl.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.facebook),
                            onPressed: () async {
                              await launchUrlString(
                                data.fbUrl,
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
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: AppConstants.innerCardPadding,
                  child: FilledButton(
                    onPressed: () => Navigator.of(context)
                        .push(PageLeadersDetails.route(data)),
                    child: Text(context.t.localAdministration.seeMore),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
