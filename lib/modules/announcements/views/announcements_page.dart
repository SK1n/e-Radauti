import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/menu_list_tile.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            content: 'Anunțuri',
            leading: Icons.announcement,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                const [
                  MenuListTile(
                    title: 'Anunțuri locale',
                    subtitle:
                        'Anunțuri de la principalele instituții\nAnunțuri de la servicii locale',
                    route: Routes.LOCAL_ANNOUNCEMENTS,
                  ),
                  MenuListTile(
                    title: 'Locuri de Muncă',
                    subtitle:
                        'Locuri de muncă preluate de pe portalul www.eradauti.ro',
                    route: Routes.JOBS,
                  ),
                  MenuListTile(
                    title: 'Imobiliare',
                    subtitle:
                        'Anunțuri de imobiliare preluate de pe portalul www.eradauti.ro',
                    route: Routes.FURNITURE,
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
