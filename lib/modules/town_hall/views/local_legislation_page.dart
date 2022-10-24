import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/legislation/local_legislation_item_model.dart';
import 'package:flutterapperadauti/data/models/legislation/local_legislation_model.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_legislation_item.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';

class LocalLegislationPage extends StatelessWidget
    with GetDataFirebase, UrlLauncher {
  const LocalLegislationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            content: 'Hotărâri de Consiliu Local',
            leading: Icons.location_city,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverToBoxAdapter(
              child: Futuristic(
                futureBuilder: () => getData(
                  document: 'Legislation',
                  convert: LocalLegislationModel.fromJson,
                ),
                dataBuilder: (context, snap) {
                  LocalLegislationModel data = snap.data;
                  List<LocalLegislationItemModel>? items = data.items;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return LocalLegislationItem(
                        title: items![index].title,
                        year: items[index].year.toString(),
                        link: items[index].link,
                      );
                    },
                    itemCount: items?.length,
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
