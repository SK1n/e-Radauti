import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_item_model.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_model.dart';
import 'package:flutterapperadauti/modules/announcements/controllers/announcements_controller.dart';
import 'package:flutterapperadauti/modules/announcements/views/local_announcements_item.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class LocalAnnouncementsPage extends GetView<AnnouncementsController> {
  const LocalAnnouncementsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      navBarMiddle: 'local-announces'.tr,
      slivers: [
        SliverToBoxAdapter(
          child: Futuristic(
            futureBuilder: () => controller.getLocalAnnouncements(),
            dataBuilder: (_, snapshot) {
              return ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot[index];
                    return LocalAnnouncementsItem(
                      data: data,
                    );
                  });
            },
            initialBuilder: (_, __) => Container(),
          ),
        ),
      ],
    );
  }
}
