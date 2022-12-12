import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/taxi/taxi_item_model.dart';
import 'package:flutterapperadauti/data/models/taxi/taxi_model.dart';
import 'package:flutterapperadauti/modules/transport/views/taxi_item.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class TaxiPage extends StatelessWidget with GetImageUrl, GetDataFirebase {
  const TaxiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'cabbies'.tr,
            leading: Icons.local_taxi,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverToBoxAdapter(
              child: Futuristic(
                futureBuilder: () =>
                    getData(document: 'Taxi', convert: TaxiModel.fromJson),
                dataBuilder: (_, snap) {
                  TaxiModel data = snap.data;
                  List<TaxiItemModel>? items = data.items;
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = items[index];
                        return TaxiItem(
                          url: item.image,
                          driver: item.driverName,
                          phone: item.phoneNumber,
                          car: item.carType,
                          plate: item.plateNumber,
                        );
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
