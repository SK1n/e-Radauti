import 'package:flutterapperadauti/data/models/leaders/leaders_item_model.dart';
import 'package:flutterapperadauti/data/models/leaders/leaders_model.dart';
import 'package:flutterapperadauti/modules/town_hall/views/leaders_item.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:get/get.dart';

class LeadersPage extends StatelessWidget with GetDataFirebase, GetImageUrl {
  const LeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const NavDrawer(),
        body: CustomScrollView(
          slivers: [
            AppBarUi(
              content: 'local-administration'.tr,
              leading: Icons.location_city,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Futuristic(
                  futureBuilder: () => getData(
                      document: 'Leaders', convert: LeadersModel.fromJson),
                  dataBuilder: (context, snap) {
                    LeadersModel data = snap.data;
                    List<LeadersItemModel>? items = data.items;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: items?.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) =>
                            LeaderCard(
                              name: items![index].name,
                              wealth: items[index].wealth,
                              interests: items[index].interests,
                              function: items[index].function,
                              email: items[index].email,
                              location: items[index].location,
                              urlFb: items[index].urlFb,
                              urlImg: items[index].urlImg,
                            ));
                  },
                ),
              ])),
            )
          ],
        ));
  }
}