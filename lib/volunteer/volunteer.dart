import 'package:flutter/material.dart';
import 'package:flutterapperadauti/volunteer/widget_volunteer_model.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutterapperadauti/widgets/src/nav_drawer.dart';
import 'package:flutterapperadauti/widgets/src/appBarModel.dart';

class VolunteerPage extends StatelessWidget {
  VolunteerPage({Key key,}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarModel().loadAppBar(context, 'Voluntariat', FontAwesome5.hand_holding_heart, _scaffoldKey),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1250,
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(15),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            childAspectRatio: (MediaQuery.of(context).size.width / 2 - 22.5) / 280,
            children: <Widget>[
              WidgetVolunteerModel().cardVolunteer("assets/images/volunteer/rc_logo_web.png", ['Rădăuțiul Civic'], ['Domeniul: Civic'], ['Telefon: 0741 975 076'], ['radautiulcivic@gmail', '.com'], ['www.radautiulcivic.ro'], 'https://www.radautiulcivic.ro/'),
              WidgetVolunteerModel().cardVolunteer("assets/images/volunteer/toastmasters.jpg", ['Toastmasters','Rădăuți'], ['Domeniul: Dezvoltare','personală, Public','speaking'], ['Telefon: 0740 757 280'], ['radautitm@gmail.com'], ['www.facebook.com/','radautitoastmasters/'], 'https://www.facebook.com/radautitoastmasters/'),
              //2
              WidgetVolunteerModel().cardVolunteer("assets/images/volunteer/eco_montan.jpg", ['Club Eco Montan'], ['Domeniul: Drumeții','montane, Mediu'], ['Telefon: 0746 814 430'], ['clubulecomontan@','gmail.com'], ['www.facebook.com/','ClubulEcoMontan','BucovinaRadauti/'], 'https://www.facebook.com/ClubulEcoMontanBucovinaRadauti/'),
              WidgetVolunteerModel().cardVolunteer("assets/images/volunteer/asociatia_bafi.png", ['BAFI (Bucuria','de a fi)'], ['Domeniul: Social,','Ecologie'], ['Telefon: 0755 403 224'], ['asociatia@bafi.ro'], ['www.bafi.ro'], 'http://www.bafi.ro'),
              //3
              WidgetVolunteerModel().cardVolunteer("assets/images/volunteer/door_to_home.png", ['Asociația Door','to Home'], ['Domeniul: Social,','Filantropic'], ['Telefon: 0230 562 751'], ['info@doortohome.ro'], ['doortohome.ro'], 'http://doortohome.ro/'),
              WidgetVolunteerModel().cardVolunteer("assets/images/volunteer/maria_ward.png", ['Asociația Maria','Ward'], ['Domeniul: Social'], ['Telefon: 0757 114 181'], ['centrul.mariaward','@gmail.com'], ['centrulsocialmaria','ward.org'], 'https://centrulsocialmariaward.org/'),
              //4
              WidgetVolunteerModel().cardVolunteer("assets/images/volunteer/umania.png", ['Asociația Umania'], ['Domeniul: Social'], ['Telefon: -'], ['ioanadeliar@','gmail.com'], ['www.facebook.com/','umania.ffs'], 'https://www.facebook.com/umania.ffs'),
            ],
          ),
        ),
      ),
    );
  }
}
