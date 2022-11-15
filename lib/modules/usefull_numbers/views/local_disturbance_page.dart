import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_disturbances/local_disturbances_item_model.dart';
import 'package:flutterapperadauti/data/models/local_disturbances/local_disturbances_model.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/utils/usefull_numbers_widget.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';

class LocalDisturbancePage extends StatelessWidget with GetDataFirebase {
  const LocalDisturbancePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            content: 'Deranjamente',
            leading: Icons.perm_phone_msg,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Futuristic(
                    futureBuilder: () => getData(
                        convert: LocalDisturbancesModel.fromJson,
                        document: 'Numbers'),
                    dataBuilder: (context, snap) {
                      LocalDisturbancesModel data = snap.data;
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
          ),
        ],
      ),
    );
  }
}
