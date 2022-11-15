import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/menu_list_tile.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';

class TownHallMain extends StatelessWidget {
  const TownHallMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            leading: Icons.location_city,
            content: 'Administrație locală',
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 30.0,
                      top: 10.0,
                    ),
                    width: MediaQuery.of(context).size.width - 30,
                    child: Image.asset(
                      "assets/images/primaria.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const MenuListTile(
                    title: 'Conducere',
                    subtitle:
                        'Informații despre primar, viceprimar și secretar.',
                    route: Routes.LEADERS,
                  ),
                  const MenuListTile(
                    title: 'Consiliul Local',
                    subtitle:
                        'Consilierii locali. Contactează-ți reprezentantul!',
                    route: Routes.LOCAL_COUNCIL,
                  ),
                  const MenuListTile(
                    title: 'Ședințe de Consiliu local',
                    subtitle: 'Vizualizează live ședințele de consiliu local.',
                    route: Routes.LOCAL_MEETINGS,
                  ),
                  const MenuListTile(
                    title: 'Hotărâri de Consiliu Local',
                    subtitle: 'Descoperă hotărârile de consiliu local.',
                    route: Routes.LOCAL_LEGISLATION,
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
