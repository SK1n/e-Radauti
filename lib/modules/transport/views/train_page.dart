import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/train/train_item_model.dart';
import 'package:flutterapperadauti/data/models/train/train_model.dart';
import 'package:flutterapperadauti/modules/transport/views/train_list_tile.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class TrainPage extends StatelessWidget with GetDataFirebase {
  const TrainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      navBarMiddle: 'trains'.tr,
      slivers: [
        SliverToBoxAdapter(
          child: Futuristic(
            initialBuilder: (_, __) => Container(),
            futureBuilder: () =>
                getData(document: 'Train', convert: TrainModel.fromJson),
            dataBuilder: (_, snapshot) {
              TrainModel data = snapshot as TrainModel;
              List<TrainItemModel>? items = data.items;
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items!.length,
                itemBuilder: (BuildContext contxt, int index) {
                  var item = items[index];
                  return ListTileRoute(
                    leadinIcon: Icons.train,
                    title: item.route!,
                    timeArray: item.timeTable!,
                    subTitle: item.train!,
                    trainRoute: item.stations!,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
