import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_model.dart';
import 'package:flutterapperadauti/utils/is_first_run.dart';
import 'package:flutterapperadauti/utils/shared_widgets/nav_drawer.dart';

class DebugSettings extends StatelessWidget {
  const DebugSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavDrawer(),
      body: CustomScrollView(
        slivers: [
          const AppBarUi(
            content: 'Debug',
            leading: Icons.bug_report_outlined,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                TextButton(
                  child: const Text('Show the intro views(first run)'),
                  onPressed: () {
                    IsFirstRun.reset();
                  },
                ),
                TextButton(
                    onPressed: () async => await FirebaseMessaging.instance
                        .getToken()
                        .then((value) => debugPrint('FCM: $value')),
                    child: const Text('print FCM'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
