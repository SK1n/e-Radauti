import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_disturbances/local_disturbances_item_model.dart';
import 'package:flutterapperadauti/data/models/local_disturbances/local_disturbances_model.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/views/usefull_numbers_widget.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_cupertino_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class LocalDisturbancePage extends StatelessWidget with GetDataFirebase {
  const LocalDisturbancePage({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomCupertinoPageScaffold(
      navBarMiddle: 'inconveniences'.tr,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Futuristic(
                initialBuilder: (_, __) => Container(),
                futureBuilder: () => getData(
                    convert: LocalDisturbancesModel.fromJson,
                    document: 'Numbers'),
                dataBuilder: (context, snapshot) {
                  LocalDisturbancesModel data =
                      snapshot as LocalDisturbancesModel;
                  List<LocalDisturbancesItemModel>? items = data.items;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = items[index];
                      return UsefullNumbersWidget(
                        title: item.title!,
                        phone: item.phoneNumbers!,
                        email: item.emails!,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
