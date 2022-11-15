import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_item_model.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_model.dart';
import 'package:flutterapperadauti/modules/announcements/views/local_announcements_item_card.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';

class LocalAnnouncementsPage extends StatelessWidget with GetDataFirebase {
  const LocalAnnouncementsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            content: 'Anunțuri locale',
            leading: Icons.announcement,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverToBoxAdapter(
              child: Futuristic(
                futureBuilder: () => getData(
                    document: 'Announcements',
                    convert: LocalAnnouncementsModel.fromJson),
                dataBuilder: (_, snapshot) {
                  LocalAnnouncementsModel data = snapshot.data;
                  debugPrint(data.items![0].toString());
                  List<LocalAnnouncementsItemModel>? items = data.items;
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        var data = items![index];
                        return LocalAnnouncementsItemCard(
                            url: data.url,
                            date: data.date,
                            host: data.host,
                            title: data.title,
                            content: data.description);
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
