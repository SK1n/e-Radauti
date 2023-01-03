import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_meetings/local_meetings_item_model.dart';
import 'package:flutterapperadauti/data/models/local_meetings/local_meetings_model.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_meetings_item.dart';
import 'package:flutterapperadauti/utils/const.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class LocalMeetingsPage extends StatelessWidget with GetDataFirebase {
  const LocalMeetingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'local-council-meetings'.tr,
            leading: Icons.location_city,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: leftMargin,
              right: rightMargin,
            ),
            sliver: SliverToBoxAdapter(
              child: Futuristic(
                initialBuilder: (_, __) => Container(),
                futureBuilder: () => getData(
                    convert: LocalMeetingsModel.fromJson,
                    document: 'CouncilMeetings'),
                dataBuilder: (BuildContext context, snapshot) {
                  LocalMeetingsModel data = snapshot as LocalMeetingsModel;
                  List<LocalMeetingsItemModel>? items = data.items;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return LocalMeetingsItem(
                        data: items[index],
                        isFirst: index == 0 ? true : false,
                      );
                    },
                    itemCount: items.length,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
