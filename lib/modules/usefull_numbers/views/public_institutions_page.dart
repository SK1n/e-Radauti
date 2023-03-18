import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/public_institutions/public_institutions_item_model.dart';
import 'package:flutterapperadauti/data/models/public_institutions/public_institutions_model.dart';
import 'package:flutterapperadauti/modules/usefull_numbers/views/usefull_numbers_widget.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_cupertino_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class PublicInstitutionsPage extends StatelessWidget with GetDataFirebase {
  const PublicInstitutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoPageScaffold(
      navBarMiddle: 'local-institutions'.tr,
      slivers: [
        SliverToBoxAdapter(
          child: Futuristic(
            initialBuilder: (_, __) => Container(),
            futureBuilder: () => getData(
                document: 'Numbers', convert: PublicInstitutionsModel.fromJson),
            dataBuilder: (context, snapshot) {
              PublicInstitutionsModel data =
                  snapshot as PublicInstitutionsModel;
              List<PublicInstitutionsItemModel>? items = data.items;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: items!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var data = items[index];
                  return UsefullNumbersWidget(
                    title: data.title,
                    phone: data.phoneNumbers,
                    email: data.emails,
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
