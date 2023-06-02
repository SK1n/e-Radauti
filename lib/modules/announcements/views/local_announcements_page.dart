import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_item_model.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_model.dart';
import 'package:flutterapperadauti/modules/announcements/views/local_announcements_item.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/custom_page_scaffold.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class LocalAnnouncementsPage extends StatelessWidget with GetDataFirebase {
  const LocalAnnouncementsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPageScaffold(
      navBarMiddle: 'local-announces'.tr,
      slivers: [
        SliverToBoxAdapter(
          child: Futuristic(
            futureBuilder: () => getData(
                document: 'Announcements',
                convert: LocalAnnouncementsModel.fromJson),
            dataBuilder: (_, snapshot) {
              LocalAnnouncementsModel data =
                  snapshot as LocalAnnouncementsModel;
              List<LocalAnnouncementsItemModel>? items = data.items;
              return ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    var data = items![index];
                    return LocalAnnouncementsItem(
                      data: data,
                    );
                  });
            },
            initialBuilder: (_, __) => Container(),
          ),
        ),
      ],
    );
  }
}
