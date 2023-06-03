import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_council/local_council_item_model.dart';
import 'package:flutterapperadauti/data/models/local_council/local_council_model.dart';
import 'package:flutterapperadauti/modules/town_hall/controllers/town_hall_controller.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_council_item.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class LocalCouncilPage extends GetView<TownHallController> {
  const LocalCouncilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      navBarMiddle: 'local-council'.tr,
      slivers: [
        SliverToBoxAdapter(
          child: Futuristic(
            initialBuilder: (_, __) => Container(),
            futureBuilder: () => controller.getLocalCouncil(),
            dataBuilder: (BuildContext context, snapshot) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.length,
                itemBuilder: (BuildContext context, int index) {
                  return LocalCouncilCard(item: snapshot[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
