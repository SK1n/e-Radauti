import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          AppBarUi(
            content: 'volunteering'.tr,
            leading: FontAwesome5.hand_holding_heart,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                delegate: SliverChildListDelegate(
                  [
                    VolunteerWidget(
                      path: "assets/images/volunteer/rc_logo_web.png",
                      description: "radautiul-civic".tr,
                    ),
                    VolunteerWidget(
                      path: "assets/images/volunteer/toastmasters.jpg",
                      description: "toast-master".tr,
                    ),
                    VolunteerWidget(
                      path: "assets/images/volunteer/eco_montan.jpg",
                      description: "club-eco".tr,
                    ),
                    VolunteerWidget(
                      path: "assets/images/volunteer/asociatia_bafi.png",
                      description: "bafi".tr,
                    ),
                    VolunteerWidget(
                      path: "assets/images/volunteer/door_to_home.png",
                      description: "door-to-home".tr,
                    ),
                    VolunteerWidget(
                      path: "assets/images/volunteer/maria_ward.png",
                      description: "maria-ward".tr,
                    ),
                    VolunteerWidget(
                      path: "assets/images/volunteer/umania.png",
                      description: "umania".tr,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class VolunteerWidget extends StatelessWidget with UrlLauncher {
  final String path;
  final String description;
  const VolunteerWidget(
      {super.key, required this.path, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            ImageWidget.asset(
              link: path,
              fit: BoxFit.scaleDown,
            ),
            SelectableAutoLinkText(
              description,
              textAlign: TextAlign.center,
              onTransformDisplayLink: AutoLinkUtils.shrinkUrl,
              linkStyle: const TextStyle(color: Colors.pinkAccent),
              onTap: (link) async {
                await launchUrl(link);
              },
            ),
          ],
        ),
      ),
    );
  }
}




//  SliverGrid.count(
//               crossAxisSpacing: 15,
//               mainAxisSpacing: 15,
//               crossAxisCount: 2,
//               childAspectRatio: Get.width / (Get.height / 1.4),
              // children: <Widget>[
              //   const VolunteerWidget(
              //     path: "assets/images/volunteer/rc_logo_web.png",
              //     description:
              //         "Rădăuțiul Civic\nTelefon: 0741975076\nradautiulcivic@gmail.com\nhttps://www.radautiulcivic.ro/",
              //   ),
              //   const VolunteerWidget(
              //     path: "assets/images/volunteer/toastmasters.jpg",
              //     description:
              //         "Toastmasters Rădăuți\n Telefon: 0740757280\nradautitm@gmail.com\nhttps://www.facebook.com/radautitoastmasters/",
              //   ),
              //   const VolunteerWidget(
              //     path: "assets/images/volunteer/eco_montan.jpg",
              //     description:
              //         "Club Eco Montan\nTelefon: 0746814430\nclubulecomontan@gmail.com\nhttps://www.facebook.com/ClubulEcoMontanBucovinaRadauti/",
              //   ),
              //   const VolunteerWidget(
              //     path: "assets/images/volunteer/asociatia_bafi.png",
              //     description:
              //         "BAFI\nTelefon: 0755403224\nasociatia@bafi.ro\nhttp://www.bafi.ro",
              //   ),
              //   const VolunteerWidget(
              //     path: "assets/images/volunteer/door_to_home.png",
              //     description:
              //         "BAFI\nTelefon: 0755403224\nasociatia@bafi.ro\nhttp://www.bafi.ro",
              //   ),
              //   WidgetVolunteerModel().cardVolunteer(
              //       "assets/images/volunteer/door_to_home.png",
              //       ['Asociația Door', 'to Home'],
              //       ['Domeniul: Social,', 'Filantropic'],
              //       ['Telefon: 0230 562 751'],
              //       ['info@doortohome.ro'],
              //       ['doortohome.ro'],
              //       'http://doortohome.ro/'),
              //   WidgetVolunteerModel().cardVolunteer(
              //       "assets/images/volunteer/maria_ward.png",
              //       ['Asociația Maria', 'Ward'],
              //       ['Domeniul: Social'],
              //       ['Telefon: 0757 114 181'],
              //       ['centrul.mariaward', '@gmail.com'],
              //       ['centrulsocialmaria', 'ward.org'],
              //       'https://centrulsocialmariaward.org/'),
              //   //4
              //   WidgetVolunteerModel().cardVolunteer(
              //       "assets/images/volunteer/umania.png",
              //       ['Asociația Umania'],
              //       ['Domeniul: Social'],
              //       ['Telefon: -'],
              //       ['ioanadeliar@', 'gmail.com'],
              //       ['www.facebook.com/', 'umania.ffs'],
              //       'https://www.facebook.com/umania.ffs'),
              // ],
//             ),