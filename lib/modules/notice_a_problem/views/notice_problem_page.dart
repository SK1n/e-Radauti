import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/views/notice_problem_map.dart';
import 'package:flutterapperadauti/modules/notice_a_problem/views/notice_problem_form.dart';

import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';

class NoticeProblemPage extends StatelessWidget {
  const NoticeProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            leading: Icons.camera,
            content: 'Sesizează o problemă',
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: NoticeProblemMap(),
                ),
                const SizedBox(
                  height: 40,
                  child: Center(
                    child: Text('TRIMITE O SESIZARE'),
                  ),
                ),
                const NoticeProblemForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
