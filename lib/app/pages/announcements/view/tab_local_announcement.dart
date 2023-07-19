import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../models/announcements/local_announcements_model.dart';
import '../cubit/local/local_announcement_cubit.dart';
import '../../../utils/extensions/timestamp_to_date.dart';
import '../../../utils/page_state.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/empty_widget.dart';
import '../../../utils/widgets/err_widget.dart';

class TabLocalAnnouncement extends StatelessWidget {
  const TabLocalAnnouncement({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalAnnouncementCubit, LocalAnnouncementState>(
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
              retry: () async =>
                  context.read<LocalAnnouncementCubit>().getData(),
            ),
          );
        }
      },
      listener: (context, state) {},
    );
  }
}

class _Item extends StatelessWidget {
  final LocalAnnouncementsItemModel item;
  const _Item({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppConstants.innerCardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: AppConstants.titleBigTextStyle,
            ),
            Text(
              t.announcements.posted_at(value: item.dateCreated.getDate),
              style: AppConstants.smallTextTextStyle,
            ),
            Padding(
              padding: AppConstants.smallTopDelimiter,
              child: Text(
                item.description,
                maxLines: AppConstants.textMaxLines,
                overflow: TextOverflow.ellipsis,
                style: AppConstants.textTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
