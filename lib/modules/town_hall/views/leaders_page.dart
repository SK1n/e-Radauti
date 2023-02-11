import 'package:flutter/cupertino.dart';
import 'package:flutterapperadauti/data/models/leaders/leaders_item_model.dart';
import 'package:flutterapperadauti/data/models/leaders/leaders_model.dart';
import 'package:flutterapperadauti/modules/town_hall/views/leaders_item.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_cupertino_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeadersPage extends StatelessWidget with GetDataFirebase, GetImageUrl {
  const LeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoPageScaffold(
      navBarMiddle: 'local-administration'.tr,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Futuristic(
                initialBuilder: (_, __) => Container(),
                futureBuilder: () => getData(
                    document: 'Leaders', convert: LeadersModel.fromJson),
                dataBuilder: (context, snapshot) {
                  LeadersModel data = snapshot as LeadersModel;
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
            ],
          ),
        ),
      ],
    );
  }
}
