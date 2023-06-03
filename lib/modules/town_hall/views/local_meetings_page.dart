import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/clients/local_legislation_client.dart';
import 'package:flutterapperadauti/data/models/local_meetings/local_meetings_item_model.dart';
import 'package:flutterapperadauti/data/models/local_meetings/local_meetings_model.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_meetings_item.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

import '../controllers/town_hall_controller.dart';

class LocalMeetingsPage extends GetView<TownHallController> {
  const LocalMeetingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      navBarMiddle: 'local-council-meetings'.tr,
      slivers: [
        SliverToBoxAdapter(
          child: Futuristic(
            initialBuilder: (_, __) => Container(),
            futureBuilder: () => controller.getLocalMeetings(),
            dataBuilder: (BuildContext context, snapshot) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return LocalMeetingsItem(
                    data: snapshot[index],
                    isFirst: index == 0 ? true : false,
                  );
                },
                itemCount: snapshot.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
