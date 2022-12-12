import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';

class PartnerPage extends StatelessWidget {
  const PartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(
            content: 'Parteneri',
            leading: Icons.add_box_outlined,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageWidget.asset(
                    link: "assets/images/fondul_pentru_democratie.png",
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageWidget.asset(
                    link: "assets/images/code_4_romania.png",
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageWidget.asset(
                    link: "assets/images/hard_power_radauti.png",
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
