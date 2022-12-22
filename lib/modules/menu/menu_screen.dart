import 'package:flutter/material.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_item_model.dart';
import 'package:flutterapperadauti/data/models/local_announcements/local_announcements_model.dart';
import 'package:flutterapperadauti/modules/air_quality/views/air_quality_center_view.dart';
import 'package:flutterapperadauti/modules/menu/home_announcements_item.dart';
import 'package:flutterapperadauti/modules/report_a_problem/views/report_problem_map.dart';
import 'package:flutterapperadauti/utils/helpers/get_data_firebase.dart';
import 'package:flutterapperadauti/utils/services/cloud_messaging_service.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:flutterapperadauti/utils/shared_widgets/navigation_bar_widget.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with GetDataFirebase {
  @override
  void initState() {
    CloudMessagingService cloudMessagingService = CloudMessagingService();
    Get.lazyPut(() => cloudMessagingService);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      extendBody: true,
      bottomNavigationBar: const NavigationBarWidget(),
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            content: 'e-radauti'.tr,
            leading: Icons.home,
          ),
          const SliverToBoxAdapter(
            child: AirQualityCenterView(),
          ),
          const SliverToBoxAdapter(
            child: ReportProblemMap(),
          ),
          SliverToBoxAdapter(
            child: Futuristic(
              initialBuilder: (_, __) => Container(),
              futureBuilder: () => getData(
                  document: 'Announcements',
                  convert: LocalAnnouncementsModel.fromJson),
              dataBuilder: (_, snapshot) {
                LocalAnnouncementsModel? data =
                    snapshot as LocalAnnouncementsModel;
                List<LocalAnnouncementsItemModel>? items = data.items ?? [];
                if (items.isEmpty) return Container();
                var element = items[items.length - 1];
                return SafeArea(
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Text(
                          'public-announcements'.tr.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        HomeAnnouncementsItem(
                          content: element.description,
                          title: element.title,
                          host: element.host,
                          date: element.date,
                          url: element.url,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 50,
          //     child: Column(
          //       children: <Widget>[
          //         SizedBox(
          //           height: 17,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: <Widget>[
          //               InkWell(
          //                 child: Text(
          //                   'about-us'.tr,
          //                   style: const TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     decoration: TextDecoration.underline,
          //                     color: Color(0xFF32325D),
          //                     fontSize: 15,
          //                   ),
          //                 ),
          //                 onTap: () => Get.toNamed(Routes.about),
          //               ),
          //               const VerticalDivider(
          //                 color: Colors.black,
          //               ),
          //               InkWell(
          //                 child: Text(
          //                   'privacy'.tr,
          //                   style: const TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     decoration: TextDecoration.underline,
          //                     color: Color(0xFF32325D),
          //                     fontSize: 15,
          //                   ),
          //                 ),
          //                 onTap: () => Get.toNamed(Routes.confidential),
          //               ),
          //             ],
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             InkWell(
          //               child: Text(
          //                 'partners'.tr,
          //                 style: const TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                   decoration: TextDecoration.underline,
          //                   color: Color(0xFF32325D),
          //                   fontSize: 15,
          //                 ),
          //               ),
          //               onTap: () => Get.toNamed(Routes.partner),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
