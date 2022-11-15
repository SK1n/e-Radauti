import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/volunteer/views/widget_volunteer_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            content: 'Voluntariat',
            leading: FontAwesome5.hand_holding_heart,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid.count(
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              childAspectRatio:
                  (MediaQuery.of(context).size.width / 2 - 22.5) / 280,
              children: <Widget>[
                WidgetVolunteerModel().cardVolunteer(
                    "assets/images/volunteer/rc_logo_web.png",
                    ['Rădăuțiul Civic'],
                    ['Domeniul: Civic'],
                    ['Telefon: 0741 975 076'],
                    ['radautiulcivic@gmail', '.com'],
                    ['www.radautiulcivic.ro'],
                    'https://www.radautiulcivic.ro/'),
                WidgetVolunteerModel().cardVolunteer(
                    "assets/images/volunteer/toastmasters.jpg",
                    ['Toastmasters', 'Rădăuți'],
                    ['Domeniul: Dezvoltare', 'personală, Public', 'speaking'],
                    ['Telefon: 0740 757 280'],
                    ['radautitm@gmail.com'],
                    ['www.facebook.com/', 'radautitoastmasters/'],
                    'https://www.facebook.com/radautitoastmasters/'),
                //2
                WidgetVolunteerModel().cardVolunteer(
                    "assets/images/volunteer/eco_montan.jpg",
                    ['Club Eco Montan'],
                    ['Domeniul: Drumeții', 'montane, Mediu'],
                    ['Telefon: 0746 814 430'],
                    ['clubulecomontan@', 'gmail.com'],
                    ['www.facebook.com/ClubulEcoMontanBucovinaRadauti/'],
                    'https://www.facebook.com/ClubulEcoMontanBucovinaRadauti/'),
                WidgetVolunteerModel().cardVolunteer(
                    "assets/images/volunteer/asociatia_bafi.png",
                    ['BAFI (Bucuria', 'de a fi)'],
                    ['Domeniul: Social,', 'Ecologie'],
                    ['Telefon: 0755 403 224'],
                    ['asociatia@bafi.ro'],
                    ['www.bafi.ro'],
                    'http://www.bafi.ro'),
                //3
                WidgetVolunteerModel().cardVolunteer(
                    "assets/images/volunteer/door_to_home.png",
                    ['Asociația Door', 'to Home'],
                    ['Domeniul: Social,', 'Filantropic'],
                    ['Telefon: 0230 562 751'],
                    ['info@doortohome.ro'],
                    ['doortohome.ro'],
                    'http://doortohome.ro/'),
                WidgetVolunteerModel().cardVolunteer(
                    "assets/images/volunteer/maria_ward.png",
                    ['Asociația Maria', 'Ward'],
                    ['Domeniul: Social'],
                    ['Telefon: 0757 114 181'],
                    ['centrul.mariaward', '@gmail.com'],
                    ['centrulsocialmaria', 'ward.org'],
                    'https://centrulsocialmariaward.org/'),
                //4
                WidgetVolunteerModel().cardVolunteer(
                    "assets/images/volunteer/umania.png",
                    ['Asociația Umania'],
                    ['Domeniul: Social'],
                    ['Telefon: -'],
                    ['ioanadeliar@', 'gmail.com'],
                    ['www.facebook.com/', 'umania.ffs'],
                    'https://www.facebook.com/umania.ffs'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
