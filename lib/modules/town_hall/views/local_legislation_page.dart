import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_legislation/local_legislation_item_model.dart';
import 'package:flutterapperadauti/data/models/local_legislation/local_legislation_model.dart';
import 'package:flutterapperadauti/modules/town_hall/controllers/local_legislation_controller.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_legislation_item.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';

class LocalLegislationPage extends StatelessWidget with UrlLauncher {
  const LocalLegislationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalLegislationController controller = Get.find();
    final TextEditingController textEditingController = TextEditingController();

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
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Futuristic(
                    futureBuilder: () =>
                        controller.getData(DateTime.now().year),
                    dataBuilder: (context, snap) {
                      return Column(
                        children: [
                          ListTile(
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(
                                  () => controller.filter.isNotEmpty
                                      ? FilledButton(
                                          onPressed: () {
                                            textEditingController.text = '';
                                            controller.filter = '';
                                            controller.filterResults();
                                          },
                                          child: const Icon(Icons.delete),
                                        )
                                      : FilledButton(
                                          child: const Icon(Icons.search),
                                          onPressed: () => {
                                                controller.filter =
                                                    textEditingController.text,
                                                controller.filterResults()
                                              }),
                                ),
                              ],
                            ),
                            title: TextField(
                              controller: textEditingController,
                            ),
                          ),
                          Obx(
                            () => controller.allResults.length != 0
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var item = controller.allResults[index];
                                      return LocalLegislationItem(
                                        title: item.title,
                                        year: item.year.toString(),
                                        link: item.link,
                                      );
                                    },
                                    itemCount: controller.allResults.length == 0
                                        ? 1
                                        : controller.allResults.length,
                                  )
                                : const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Nu am gasit nici un rezultat'),
                                  ),
                          ),
                        ],
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
