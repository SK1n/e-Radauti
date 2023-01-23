import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/app_bar_widget.dart';
import 'package:flutterapperadauti/utils/is_first_run.dart';
import 'package:get/get.dart';

class DebugSettings extends StatelessWidget {
  const DebugSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const AppBarWidget(
            content: 'Debug',
            leading: Icons.bug_report_outlined,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                FilledButton(
                  child: const Text('Show the intro views(first run)'),
                  onPressed: () {
                    IsFirstRun.reset();
                  },
                ),
                FilledButton(
                    onPressed: () async => await FirebaseMessaging.instance
                        .getToken()
                        .then((value) => debugPrint('FCM: $value')),
                    child: const Text('print FCM')),
                FilledButton(
                  onPressed: () async {
                    await FirebaseMessaging.instance.subscribeToTopic('test');
                    Get.showSnackbar(const GetSnackBar(
                      title: 'Success',
                      message: 'subscribed to topic test',
                      duration: Duration(seconds: 1),
                    ));
                  },
                  child: const Text(
                    'Subscribe to test topic!',
                  ),
                ),
                FilledButton(
                  onPressed: () async {
                    await FirebaseMessaging.instance
                        .unsubscribeFromTopic('test');
                    Get.showSnackbar(const GetSnackBar(
                      title: 'Success',
                      message: 'unsubscribed to topic test',
                      duration: Duration(seconds: 1),
                    ));
                  },
                  child: const Text(
                    'Unsubscribe to test topic!',
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
