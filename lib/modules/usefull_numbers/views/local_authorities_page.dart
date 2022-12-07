import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_authorities/local_authorities_item_model.dart';
import 'package:flutterapperadauti/data/models/local_authorities/local_authorities_model.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/views/usefull_numbers_widget.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class LocalAuthoritiesPage extends StatelessWidget with GetDataFirebase {
  const LocalAuthoritiesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarUi(
            content: 'local-authorities'.tr,
            leading: Icons.perm_phone_msg,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Futuristic(
                    futureBuilder: () => getData(
                        document: 'Numbers',
                        convert: LocalAuthoritiesModel.fromJson),
                    dataBuilder: (context, snap) {
                      LocalAuthoritiesModel data = snap.data;
                      List<LocalAuthoritiesItemModel>? items = data.items;
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = items[index];
                            return UsefullNumbersWidget(
                              title: data.title,
                              phone: data.phoneNumbers,
                              email: data.emails,
                            );
                          });
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
