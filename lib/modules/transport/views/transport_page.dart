import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/menu_list_tile.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';

class TransportPage extends StatelessWidget {
  const TransportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            content: 'Transport',
            leading: Icons.train,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const MenuListTile(
                    title: 'Taximetriști',
                    subtitle: 'Lista taximetriștilor autorizați din Rădăuți',
                    route: Routes.TAXI,
                  ),
                  const MenuListTile(
                    title: 'Trenuri',
                    subtitle: 'Lista trenurilor din Rădăuți',
                    route: Routes.TRAIN,
                  ),
                  const MenuListTile(
                    title: 'Microbuze',
                    subtitle: 'Lista microbuzelor pe ruta Rădăuți - Suceava',
                    route: Routes.BUS,
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
