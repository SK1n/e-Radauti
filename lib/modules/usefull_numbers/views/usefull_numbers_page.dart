import 'package:flutter/material.dart';
import 'package:flutterapperadauti/routes/app_pages.dart';
import 'package:flutterapperadauti/utils/shared_widgets/menu_list_tile.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';

class UsefullNumbersPage extends StatelessWidget {
  const UsefullNumbersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(slivers: [
        const AppBarUi(
          content: 'Numere utille',
          leading: Icons.perm_phone_msg,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const MenuListTile(
                  title: 'Deranjamente',
                  subtitle:
                      'Date de contact pentru informații sau reclamații privind serviciile de alimentare cu apă, canalizare sau servicii comunale',
                  route: Routes.LOCAL_DISTURBANCE,
                ),
                const MenuListTile(
                  title: 'Autorități locale',
                  subtitle:
                      'Date de contact pentru principalele autorități publice locale (primărie, spital, poliție etc.)',
                  route: Routes.LOCAL_AUTHORITIES,
                ),
                const MenuListTile(
                  title: 'Instituții publice',
                  subtitle:
                      'Date de contact pentru principalele instituții de protecție civilă (a consumatorului, copilului, animalelor, mediului etc.)',
                  route: Routes.PUBLIC_INSTITUTIONS,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
