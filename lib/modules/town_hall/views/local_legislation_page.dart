import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/town_hall/controllers/local_legislation_controller.dart';
import 'package:flutterapperadauti/modules/town_hall/views/local_legislation_item.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:get/get.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

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
          AppBarUi(
            content: 'local-council-decisions'.tr,
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
                          SearchBarAnimation(
                              searchBoxColour: Get.isDarkMode
                                  ? context.theme.canvasColor
                                  : Colors.white,
                              textEditingController: textEditingController,
                              searchBoxBorderColour: Get.isDarkMode
                                  ? context.theme.canvasColor
                                  : Colors.white,
                              isOriginalAnimation: true,
                              cursorColour:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              enteredTextStyle: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                              hintText: '',
                              trailingWidget: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Obx(
                                      () => InkWell(
                                          onTap: () {
                                            if (controller.filter.isNotEmpty) {
                                              textEditingController.clear();
                                              controller.filter = '';
                                              controller.filterResults();
                                            }
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: controller.filter.isEmpty
                                                ? Colors.transparent
                                                : context.theme.iconTheme.color,
                                          )),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.filter =
                                            textEditingController.text;
                                        controller.filterResults();
                                      },
                                      child: const Icon(Icons.search)),
                                ],
                              ),
                              secondaryButtonWidget:
                                  const Icon(Icons.arrow_back),
                              buttonWidget: const Icon(Icons.search)),
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
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('no-results-found'.tr),
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
