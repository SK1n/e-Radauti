import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_council/local_council_item_model.dart';
import 'package:flutterapperadauti/data/models/local_council/local_council_model.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_council_item.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class LocalCouncilPage extends StatelessWidget with GetDataFirebase {
  const LocalCouncilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'local-council'.tr,
            leading: Icons.location_city,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Futuristic(
                  futureBuilder: () => getData(
                      document: 'LocalCouncil',
                      convert: LocalCouncilModel.fromJson),
                  dataBuilder: (BuildContext context, AsyncSnapshot snap) {
                    LocalCouncilModel data = snap.data;
                    List<LocalCouncilItemModel>? items = data.items;
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: items!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return LocalCouncilCard(
                            url: items[index].url,
                            name: items[index].name,
                            function: items[index].function,
                            party: items[index].party,
                            phoneNumber: items[index].phoneNumber,
                            email: items[index].email,
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
