import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../models/e_radauti_website/e_radauti_website_model.dart';
import '../cubit/furniture/furniture_cubit.dart';
import '../../../utils/extensions/format_date.dart';
import '../../../utils/page_state.dart';
import '../../../utils/widgets/err_widget.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/empty_widget.dart';

import 'package:url_launcher/url_launcher_string.dart';

class TabFurnitureAnnouncement extends StatelessWidget {
  const TabFurnitureAnnouncement({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FurnitureCubit, FurnitureState>(
      builder: (context, state) {
        if (state.state.isInProgress) {
          return const SliverToBoxAdapter(child: LoadingWidget());
        } else if (state.state.isSuccess) {
          if (state.data.isEmpty) {
            return SliverToBoxAdapter(
              child: EmptyWidget(text: t.announcements.emptyAnnouncements),
            );
          }
          return SliverList.builder(
            itemBuilder: (context, index) {
              return _Item(
                item: state.data[index],
              );
            },
            itemCount: state.data.length,
          );
        } else {
          return SliverToBoxAdapter(
            child: ErrWidget(
              error: state.errorMessage,
              retry: () async => context.read<FurnitureCubit>().getData(),
            ),
          );
        }
      },
      listener: (context, state) {},
    );
  }
}

class _Item extends StatelessWidget {
  final ERadautiWebsiteRecordsModel item;
  const _Item({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppConstants.innerCardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppConstants.leftDelimiter,
              child: Text(item.title, style: AppConstants.titleBigTextStyle),
            ),
            Padding(
              padding: AppConstants.leftDelimiter,
              child: Text(
                t.announcements.posted_at(
                  value: item.dateCreated.format(),
                ),
                style: AppConstants.smallTextTextStyle,
              ),
            ),
            Padding(
              padding: AppConstants.innerCardPadding,
              child: Text(
                item.rawContent,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: AppConstants.textTextStyle,
              ),
            ),
            Padding(
              padding: AppConstants.innerCardPadding,
              child: GestureDetector(
                onTap: () async {
                  String link =
                      '${AppConstants.furnitureSlug}${item.slug}-${item.id}';
                  if (await canLaunchUrlString(link)) {
                    await launchUrlString(link);
                  }
                },
                child: Text(
                  t.announcements.seeDetails,
                  style: AppConstants.linkTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
