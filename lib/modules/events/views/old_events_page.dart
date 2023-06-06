import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/events/controllers/old_events_controller.dart';
import 'package:flutterapperadauti/modules/events/views/events_item_widget.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/empty_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';
import 'package:get/get.dart';

class OldEventsPage extends GetView<OldEventsController> {
  const OldEventsPage({super.key});
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
          text: 'empty-events'.tr,
        ),
      ),
      onError: (error) => SliverToBoxAdapter(
        child: ErrWidget(
          error: error.toString(),
          retry: () => controller.getEvents(),
        ),
      ),
      onLoading: const SliverToBoxAdapter(child: LoadingWidget()),
    );
  }
}
