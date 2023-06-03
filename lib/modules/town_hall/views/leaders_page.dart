import 'package:flutter/cupertino.dart';
import 'package:flutterapperadauti/data/models/leaders/leaders_item_model.dart';
import 'package:flutterapperadauti/data/models/leaders/leaders_model.dart';
import 'package:flutterapperadauti/modules/town_hall/controllers/town_hall_controller.dart';
import 'package:flutterapperadauti/modules/town_hall/views/leaders_item.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeadersPage extends GetView<TownHallController> {
  const LeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      navBarMiddle: 'local-administration'.tr,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Futuristic(
                initialBuilder: (_, __) => Container(),
                futureBuilder: () => controller.getLeaders(),
                dataBuilder: (context, snapshot) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => LeaderCard(
                    item: snapshot[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
