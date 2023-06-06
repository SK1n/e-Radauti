import 'package:flutter/material.dart';
import 'package:flutterapperadauti/controllers/dao_controller.dart';
import 'package:flutterapperadauti/modules/events/controllers/favorites_events_controller.dart';
import 'package:flutterapperadauti/modules/events/controllers/new_events_controller.dart';
import 'package:flutterapperadauti/modules/events/views/events_item_widget.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/empty_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';
import 'package:get/get.dart';

class FavoritesEventsPage extends GetView<FavoritesEventsController> {
  const FavoritesEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) => SliverList.builder(
        itemBuilder: (context, index) => EventsItemWidget(
          data[index],
        ),
        itemCount: data!.length,
      ),
      onEmpty: SliverToBoxAdapter(
        child: EmptyWidget(
          text: 'empty-favorites-events'.tr,
        ),
      ),
      onError: (error) => SliverToBoxAdapter(
        child: ErrWidget(
          error: error.toString(),
          retry: () => controller.getFavoritesEvents(),
        ),
      ),
      onLoading: const SliverToBoxAdapter(child: LoadingWidget()),
    );
  }
}
