import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/screens/views/partner_item.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';

class PartnerPage extends StatelessWidget {
  const PartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            content: 'Parteneri',
            leading: Icons.add_box_outlined,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            PartnerItem().widgetItem(
                "assets/images/fondul_pentru_democratie.png",
                "Fondul pentru Democrație",
                context),
            PartnerItem().widgetItem(
                "assets/images/code_4_romania.png", "Code4Romania", context),
            PartnerItem().widgetItem("assets/images/hard_power_radauti.png",
                "Hard Power Services Rădăuți", context),
          ])),
        ],
      ),
    );
  }
}
