import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_authorities/local_authorities_item_model.dart';
import 'package:flutterapperadauti/data/models/local_authorities/local_authorities_model.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/views/usefull_numbers_widget.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_cupertino_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class LocalAuthoritiesPage extends StatelessWidget with GetDataFirebase {
  const LocalAuthoritiesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomCupertinoPageScaffold(
      navBarMiddle: 'local-authorities'.tr,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Futuristic(
                initialBuilder: (_, __) => Container(),
                futureBuilder: () => getData(
                    document: 'Numbers',
                    convert: LocalAuthoritiesModel.fromJson),
                dataBuilder: (context, snapshot) {
                  LocalAuthoritiesModel data =
                      snapshot as LocalAuthoritiesModel;
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
      ],
    );
  }
}
